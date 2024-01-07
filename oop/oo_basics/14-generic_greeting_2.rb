# Add two methods: ::generic_greeting and #personal_greeting.
#   ::generic_greeting should be a class method and print a generic class greeting
#   #personal_greeting should be an instance method and print an object-specific
#     greeting.

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def personal_greeting
    puts "Hello! My name is #{name}!"
  end

  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end
end

kitty = Cat.new('Sophie')

Cat.generic_greeting #=> Hello I'm a cat
kitty.personal_greeting #=> Hello my name is Sophie