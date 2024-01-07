# Refactor the following classes so they all use a common superclass.
# Inherit behaviors as needed.

class Vehicle
  attr_reader :make, :model

  def initialize(make, model)
    @make, @model = make, model
  end

  def to_s
    "#{make} #{model}"
  end

  def wheels
    4
  end
end

class Car < Vehicle
end

class Motorcycle < Vehicle
  def wheels
    2
  end
end

class Truck < Vehicle
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end

  def wheels
    6
  end
end

# Further Exploration: Does it make sense to define a Vehicle#wheels method, even
#   though all the remaining classes would override it? Why or why not?

# I think it does make sense to define a Vehicle#wheels method, as the vast majority
#   of Vehicles do have wheels. I would probably set the default number of wheels 
#   to 4, as cars are the most common and broad type of vehicle in day-to-day life.

# Instead of overriding Vehicle#wheels for each class, we can also set a constant
#   for each class denoting the number of wheels. We can then have Vehicle#wheels
#   return the value of that constant.

# eg. 
class Vehicle
  attr_reader :make, :model

  def initialize(make, model)
    @make, @model = make, model
  end

  def to_s
    "#{make} #{model}"
  end

  def wheels
    self.class::WHEEL_COUNT
  end
end

class Car < Vehicle
  WHEEL_COUNT = 4
end

class Motorcycle < Vehicle
  WHEEL_COUNT = 2
end

class Truck < Vehicle
  WHEEL_COUNT = 6

  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end
end

car = Car.new('toyota', 'rav4')
puts car.wheels #=> 4
