# ASCII String Value
# Write a method that determines and returns the ASCII string value of a given
# string.
# ASCII String value is the sum of the ASCII values of every character in the
# string.
# - You may use #ord to determine the ASCII value of a character.

# Input: String
# Output: Integer representing the sum total of the ASCII value of each character
#   in the string.

# Examples:
# ascii_value('Four score') == 984
# ascii_value('Launch School') == 1251
# ascii_value('a') == 97
# ascii_value('') == 0
#   - empty case is not handled by ord - guard clause

# Data: 
# String that is given as an input
# -> Convert to Array of each character in the string

# Algorithm:
# Given an input String, str:
#   Initialize a new variable ascii_sum = 0

#   Split str into an array containing each of its individual characters
#   Iterate through characters. For each character:
#     Determine the #ord value (ASCII value) of the current character, then
#     add ord value to ascii_sum
#   Return ascii_sum

def ascii_value(str)
  ascii_sum = 0
  str.each_char { |char| ascii_sum += char.ord }
  ascii_sum
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0