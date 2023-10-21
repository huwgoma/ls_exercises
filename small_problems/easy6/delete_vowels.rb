# Delete Vowels
# Write a method that takes an array of strings, and returns an array with
#   the same string values, but with all vowels removed
#   Vowel = a e i o u 

# Input: 
#   An Array containing x number of Strings
# Output: 
#   A new(?) Array, containing new(?) Strings - identical to the original 
#   Array's Strings, but with their vowels removed.

# Examples:
# remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
# remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
# remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

# Data:
#   The input Array
#     Each String object in the input Array
#   The output Array (that we will build string-by-string)

# Algorithm:
# Given an input Array of Strings, strings:
# Initialize a new empty Array, result = []
#   (Transformation) Iterate through strings. For each string:
#     Initialize a new empty string = ''
#     (Selection) Iterate through the current string's characters. 
#       If the current character is a vowel (included in aeiou), go next,
#       otherwise, append the current character to the new string.
#     Append the result string to result array
#   Return the result array.

VOWELS = %w(a e i o u A E I O U)

def remove_vowels(strings)
  strings.map do |string|
    string.chars.reject do |char|
      VOWELS.include?(char)
    end.join
  end
end

# Refactor
# Given an input Array of Strings, strings:
# Transform strings: Iterate through strings. For each string:
#   Create a new String containing all characters from the current String 
#     except vowels.
#     - Non-destructively delete vowels from the current String
#   Return the new String.
# Return array of transformed strings 

# def remove_vowels(strings)
#   strings.map do |string|
#     string.delete('aeiouAEIOU')
#   end
# end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']