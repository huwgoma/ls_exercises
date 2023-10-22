# Swap Case
# Write a method that takes a String and returns a NEW string where
# every uppercase letter is replaced by lowercase, and vice-versa.
# Non-alphabetic characters should remain unchanged.
# - Do not use #swapcase

# Input: A String
# Output: A -new- string with alphabetic characters being case-swapped and 
#   non-alphabetic characters identical.

# Examples:
# swapcase('CamelCase') == 'cAMELcASE'
# swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

# Data: 
#   The input String - probably need to iterate over its characters
#   The output String - probably need to build it char-by-char

# Algorithm:
# Given a string as input, str:
#   Initialize a new empty string, result = ''
#   Initialize two constant arrays UPPERCASE and LOWERCASE: A-Z a-z
#   (Transformation) Iterate over str's characters. For each each character:
#     If the current char is uppercase => same letter, but lowercase
#     If current char is lowercase => same letter, but uppercase
#     Otherwise => same character
#   => Returns an array of str's characters but transformed 
#   Join this array of characters into a new string.
# Return the joined string. 

UPPERCASE = Array('A'..'Z')
LOWERCASE = Array('a'..'z')

def swapcase(str)
  str.chars.map do |char|
    if UPPERCASE.include?(char)
      char.downcase
    elsif LOWERCASE.include?(char)
      char.upcase
    else
      char
    end
  end.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'