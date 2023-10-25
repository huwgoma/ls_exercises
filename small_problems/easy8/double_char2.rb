# Double Char (Part 2)
# Write a method that takes a string and returns a new string with every consonant
# character doubled.
# - Vowels (aeiouAEIOU), digits, punctuation, and whitespace should not be 2x'd

# Input: a string
# Output: A new string
#   - every consonant letter character is doubled.
#   - any other characters should not be doubled

# Examples:
# double_consonants('String') == "SSttrrinngg"
# double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
# double_consonants("July 4th") == "JJullyy 4tthh"
# double_consonants('') == ""

# Data:
#   The string given as input - probably split into array of chars and iterate
#   The string that we will build and return as output

# Algorithm:
# Given a string as input, str:
# Initialize 3 constants:
#   - VOWELS = aeiouAEIOU; ALPHABET = a..z + A..Z
#   - CONSONANTS = ALPHABET - VOWELS
# Split str into an array of its chars and iterate (transform). For each char:
#   If the character is a consonant, return the character but doubled
#   Otherwise, just return the character
# => Array of characters (consonants doubled)
# Join the array of chars into a string and return

VOWELS = %w(a e i o u A E I O U)
ALPHABET = Array('a'..'z') + Array('A'..'Z')
CONSONANTS = ALPHABET - VOWELS

def double_consonants(str)
  str.chars.map do |char|
    CONSONANTS.include?(char) ? char * 2 : char
  end.join
end


p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""