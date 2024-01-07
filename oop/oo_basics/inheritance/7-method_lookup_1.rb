# Determine the lookup path used when invoking cat1.color. Only list the classes 
#   that were checked by Ruby when it searched for #color.

class Animal
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new('Black')
cat1.color
# Cat -> Animal (Animal's attr_reader for @color) (Stop here since method was found)
