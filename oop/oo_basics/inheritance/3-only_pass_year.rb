# Allow Truck to accept a second argument on initialization. Name the 2nd parameter
#   bed_type, and implement the modification so that Car continues to only 
#   accept one argument.

class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
  attr_reader :bed_type

  def initialize(year, bed_type)
    super(year)
    @bed_type = bed_type
  end
end

class Car < Vehicle
end

truck1 = Truck.new(1994, 'Short')
puts truck1.year #=> 1994
puts truck1.bed_type #=> "Short"