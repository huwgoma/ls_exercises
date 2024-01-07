# Create a class named Cat that tracks the number of times a new Cat object
#   is instantiated. 
# Write a class method ::total that prints the number of Cat instances.

class Cat
  @@number_of_cats = 0

  def initialize
    @@number_of_cats += 1
  end

  def self.total 
    puts @@number_of_cats
  end
end

kitty1 = Cat.new
kitty2 = Cat.new

Cat.total #=> 2