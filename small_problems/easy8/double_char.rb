# Double Char (Part 1)
# Write a method that takes a string and returns a new string where every character
#   is doubled.

# Input: A string
# Output: A new string with the same characters, but every character occurs twice
#   instead of once (doubled)

# Examples:
# repeater('Hello') == "HHeelllloo"
# repeater("Good job!") == "GGoooodd  jjoobb!!"
# repeater('') == ''

# Data:
#   The string given as input - may split into array of chars
#   The output string that we will build char-by-char

# Algorithm:
# Given a string as input, str:
# Split str into an array of its characters.
# (transform) Iterate over characters. For each character:
#   Create a new string that has the value of the current character, twice
#   eg. char = 'a', return 'aa'
# => Array of doubled characters
# Join the array of characters back together into a string.

def repeater(str)
  str.chars.map { |char| char * 2 }.join
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''