# Given the following code:
# puts 'Hello'
# puts 5
# puts [1, 2, 3]

# Update the code so that each statement prints the name of the class of puts' 
#   argument.
# Expected output:
#   String
#   Integer
#   Array

# puts 'Hello'.class
# puts 5.class
# puts [1, 2, 3].class

['Hello', 5, [1, 2, 3]].each { |obj| puts obj.class }