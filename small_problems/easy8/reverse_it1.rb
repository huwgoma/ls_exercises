# Reverse It (Part 1)

# Write a method that takes one argument (string) and returns a new string with
#   the words in reverse order.
#   - Words are space-separated
#   - The letters within the words themselves are not reversed

# Input: A string
# Output: A new string with words (space-separated) in reverse order
#   - If the string consists solely of blank space, an empty string should 
#   be returned (any amount of blankspace)

# Examples:
# puts reverse_sentence('Hello World') == 'World Hello'
# puts reverse_sentence('Reverse these words') == 'words these Reverse'
# puts reverse_sentence('') == ''
# puts reverse_sentence('    ') == '' # Any number of spaces results in ''

# Data:
#   The string given as input - Will need to split into 'words' and iterate
#   The string that we will build and return as output

# Algorithm:
# Given a string as input, str:
# Split str into words (split on spaces). 
# Reverse words and join the reversed array together

def reverse_sentence(str)
  str.split.reverse.join(' ')
end

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''


# Algorithm without reverse
# Given a string as input, str:
# Initialize a new empty array, reversed = []
# Split str into words (on spaces) and iterate over words. For each word:
#   Insert the current word into the FRONT of reversed string (or convert reversed
#     to an array lol)
# Return reversed

def reverse_sentence(str)
  reversed = []
  str.split.each do |word|
    reversed.unshift(word)
  end
  reversed.join(' ')
end

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''