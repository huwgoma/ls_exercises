# Add a parameter to initialize that provides a name for the Cat object.
# Use an instance variable to print a greeting with the given name.
# Expected output: Hello! My name is Sophie!

class Cat
  attr_reader :name 
  
  def initialize(name)
    @name = name
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new('Sophie')