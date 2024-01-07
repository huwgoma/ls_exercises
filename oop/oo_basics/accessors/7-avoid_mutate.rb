# The following code currently allows @name to be modified from the outside:
# class Person
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end
# end

# person1 = Person.new('James')
# person1.name.reverse!
# puts person1.name #=> 'semaJ'

# Fix the code so that the name getter returns a copy of @name, instead of a reference
#   to it.

class Person
  def initialize(name)
    @name = name
  end

  def name
    @name.dup
  end
end

person1 = Person.new('James')
person1.name.reverse!
puts person1.name # => James