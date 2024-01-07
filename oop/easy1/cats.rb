# Update the code to produce the desired output:
class Pet
  attr_reader :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end
end

class Cat < Pet
  attr_reader :color

  def initialize(name, age, color)
    super(name, age)
    @color = color
  end

  def to_s
    "My cat #{name} is #{age} years old and has #{color} fur."
  end
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch
# My cat Pudding is 7 years old and has black and white fur.
# My cat Butterscotch is 10 years old and has tan and white fur.

# Further Exploration: We could also modify Pet to accept a colors parameter. If 
#   we did this, we would not need to supply an initialize method for Cat.
#   Why would we be able to omit Cat#initialize? Would it be a good idea to modify
#   Pet in this way? Why or why not?

# We would be able to omit Cat#initialize because Cat would simply inherit the
#   #initialize method from Pet, which would be identical to our existing 
#   Cat#initialize method.

# I personally do not see much risk in modifying Pet like so, since color is a state
#   that is not specific to certain pets - all Pets do have a color attribute, so
#   it makes sense for all Pet objects to track the color state.