# Letter Counter (1)
# Write a method that takes a string with one (or more) space-separated words
#   and returns a hash that shows the number of words of different sizes
#   - How many words are there of each length in the string?
# A word is a string of characters that does not include a space.

# Input: 
#   A String containing one or multiple words (separated by spaces)
# Output:
#   A Hash containing key-value pairs describing how many occurrences of each
#   word length is in the String.
#     eg. How many 3-letter words are in the string? (One.) 3 => 1 

# Examples:
# word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
# word_sizes('Hey diddle diddle, the cat and the fiddle!') 
#   == { 3 => 5, 6 => 1, 7 => 2 }
# word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
# word_sizes('') == {}

# Data: 
#   String as input - Probably will split into an array of words (split on space)
#   Hash as output
#     Keys: The word lengths
#     Values: # of occurrences of that specific word length in the string

# Algorithm:
# Given an input String, str:
#   Split str into an array of 'words', splitting on spaces.
#   Initialize a new empty hash result = {}. set default values to 0
#   Iterate through words. For each word:
#     Calculate the current word's length
#     Update the corresponding key-value pair for that length
#       result[length] += 1 (+1 occurrence)
#   Return result hash

def word_sizes(str)
  words = str.split
  words.each_with_object(Hash.new(0)) do |word, sizes|
    sizes[word.length] += 1
  end
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}