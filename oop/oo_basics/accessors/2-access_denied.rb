# Modify the following code so that the value of @phone_number can be read, but 
#   not changed.

class Person
  attr_reader :phone_number

  def initialize(number)
    @phone_number = number
  end
end

person1 = Person.new(1234567899)
puts person1.phone_number

person1.phone_number = 9987654321 # undefined method phone_number= called
puts person1.phone_number