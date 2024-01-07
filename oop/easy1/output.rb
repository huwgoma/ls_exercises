# What does the following code output?

class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{name.upcase}."
  end
end

# name = 'Fluffy'
# fluffy = Pet.new(name)
# puts fluffy.name # Fluffy
# puts fluffy      # My name is FLUFFY
# puts fluffy.name # FLUFFY
# puts name        # FLUFFY

# Desired Output:
name = 'Fluffy'
fluffy = Pet.new(name)
puts fluffy.name # Fluffy
puts fluffy      # My name is FLUFFY
puts fluffy.name # Fluffy
puts name        # Fluffy


# Further Exploration
# What would happen in this case?

name = 42
fluffy = Pet.new(name)
name += 1 # 43
puts fluffy.name # 42
puts fluffy      # My name is 42
puts fluffy.name # 42
puts name # 43

# When a new Pet object is initialized, the argument that is passed in is converted
# to a string object by the `name.to_s` call. This explains why the `puts fluffy` 
# line works, and does not produce an error - if the string conversion did not 
# happen, Ruby would throw an error when the Pet#to_s method is called, as Integers
# do not have an #upcase method (#to_s is implicitly called on the argument of puts)

