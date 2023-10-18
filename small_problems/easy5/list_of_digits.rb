# List of Digits
# Write a method that takes one argument (positive Integer) and returns a 
#   list(?) of the digits in the number.

# Input: An Integer (positive)
# - Assume input will always be a positive integer?
# Output: A list (Array) of the digits in the given number.

# Examples:
# p digit_list(12345) == [1, 2, 3, 4, 5]     # => true
# p digit_list(7) == [7]                     # => true
# p digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
# p digit_list(444) == [4, 4, 4]             # => true

# Data: 
#   An Array (to be returned)
#   An Integer (as input)
#     -Convert to String (without #digits)

# Algorithm (Without #digits)
# Given an input Integer, int:
#   Convert int to a String, strint.
#   Split strint into its characters.
#   Map over strint characters and convert each character to an Integer again
# Return that array

def digit_list(int)
  chars = int.to_s.chars
  chars.map(&:to_i)
end

def digit_list(int)
  int.digits.reverse
end

p digit_list(12345) == [1, 2, 3, 4, 5]     # => true
p digit_list(7) == [7]                     # => true
p digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
p digit_list(444) == [4, 4, 4]             # => true