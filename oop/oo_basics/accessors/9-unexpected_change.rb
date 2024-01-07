# Modify the code to accept a string, containing a first/last name. The name should 
#   be split on spaces and assigned to 2 instance variables in the setter
#   method, then joined in the getter method to form a full name

class Person
  def name=(name)
    @first_name, @last_name = name.split
  end

  def name
    "#{@first_name} #{@last_name}"
  end
end

person1 = Person.new
person1.name = 'John Doe' # @first = John, @last = Doe
puts person1.name # => John Doe

