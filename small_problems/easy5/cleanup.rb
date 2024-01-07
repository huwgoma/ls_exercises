# Clean Up the Words
# Given a string containing some words (all lowercase) and an assortment of
# non-alphabetic characters, write a method that returns that string, with all
# non-alphabetic characters replaced by spaces.
# - If one or more non-alphabetic characters occur in a row, replace them all 
#   with a single space.

# Input: A String
# - Contains words (space-separated + alphabetic letters)
# - Non-alphabetic characters will be within the 'words'
# Output: Also a string
# - Contains the same contents as the original string, but with all non-alphabetic
#   characters replaced with spaces 
# - Consecutive non-alphabetic chars should be replaced with a single space

# Example:
# cleanup("---what's my +*& line?") == ' what s my line '
# --- gets replaced by a single ' '
# same with ', +*&, and ?

# Data:
# The String given as input
# - Probably iterate over each character of the string and build a new string
#   char-by-char
# - If current character is alphabetic, leave it as-is in the new string 
# - If current character is non-alphabetic:
#   - If the last character of the new string is a space, do not add anything
#   - Otherwise, add a space.

# Algorithm (without squeeze):
# Given a string as input, str:
# Initialize a new empty string, result = ''
# Iterate over each character of str. For each char:
#   If character is alphabetic, add char to result
#   Otherwise:
#     If result's last character is a space, do not add anything
#     Otherwise, add a space ' ' to result
# Return result

ALPHABET = Array('a'..'z')

def cleanup(str)
  result = ''
  str.each_char do |char|
    if ALPHABET.include?(char)
      result << char 
    else
      result << ' ' unless result[-1] == ' '
    end
  end
  result
end

p cleanup("---what's my +*& line?") == ' what s my line '

# Algorithm (with squeeze):
# Given a string as input, str:
# (Transformation) Iterate over each character of str: For each char:
#   If char is alphabetic, return (from block) char.
#   Otherwise, return (from block) a space char.
# => Array of transformed characters (with non-alphabetic chars replaced by 
#    spaces)
# Join the array back into a string, then remove all duplicate space characters.

def cleanup(str)
  str.chars.map do |char|
    ALPHABET.include?(char) ? char : ' '
  end.join.squeeze(' ')
end
p cleanup("---what's my +*& line?") == ' what s my line '

# "Remove all duplicate spaces" - How would you do this without squeeze?

