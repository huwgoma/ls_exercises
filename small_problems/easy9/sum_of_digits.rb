# Sum of Digits
# Write a method that takes a positive integer and returns the sum of its digits.

# Input:
#   An integer
# Output:
#   Another integer representing the sum of the input integer's individual digits

# Examples:
# puts sum(23) == 5
# puts sum(496) == 19
# puts sum(123_456_789) == 45

# Data: 
#   The integer given as input
#   - Will need to obtain an array of input integer's digits

# Algorithm:
# Given an integer as input, int:
#   Create an array of int's digits
#   Sum the elements of the digits array

def sum(int)
  int.digits.sum
end

# Without #digits - how to obtain array of digits?
# Convert integer to a string
# Split string into an array of its characters
# Map over characters and convert each string back to an int

def sum(int)
  int.to_s.chars.map(&:to_i).sum
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45