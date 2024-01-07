# Move the greeting from the initialize method to an instance method, #greet,
#   that prints a greeting when invoked.
# - We still want the greeting to be invoked on each initialization.

class Cat
  attr_reader :name 
  
  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet