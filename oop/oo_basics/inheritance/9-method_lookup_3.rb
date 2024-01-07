# Determine the lookup path used when invoking bird1.color. Only list the classes
#   and modules that will be checked during the method lookup.

module Flyable
  def fly
    "I'm flying!"
  end
end

class Animal
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

class Cat < Animal
end

class Bird < Animal
  include Flyable
end

bird1 = Bird.new('Red')
bird1.color
# Bird -> Flyable -> Animal (Animal's attr_reader :color method) - Stop here