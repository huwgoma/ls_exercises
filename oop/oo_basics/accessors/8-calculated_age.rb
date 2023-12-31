# Multiply @age by 2 on assignment, then multiply @age by 2 again when 
#   @age is returned by its getter.

class Person
  def age=(age)
    @age = double(age)
  end

  def age
    double(@age)
  end

  private 

  def double(value)
    value * 2
  end
end

person1 = Person.new
person1.age = 20 # => @age = 40
puts person1.age # => 80 (but @age remains 40)