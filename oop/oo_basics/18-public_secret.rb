# Create a class named Person with an instance variable @secret. 
# Use a setter method to add a value to @secret, then use a getter method to print
#   @secret's value

class Person
  attr_accessor :secret
end


person = Person.new
person.secret = 'Shh.. this is a secret!'
puts person.secret 
# Shh.. this is a secret!