# Add an initialize method that prints "I'm a cat!" whenever a new Cat object
#   is instantiated.
class Cat
  def initialize
    puts "I'm a cat!"
  end
end

kitty = Cat.new