# Letter Counter Part 1
# Write a method that takes a string with one (or more) space-separated words and
#   returns a hash with key-value pairs describing the number of occurrences of 
#   each word size.
#   eg. 'Four score and seven.' => 3 => 1, 4 => 1, 5 => 1, 6 => 1
# - Words are any sequence of characters that do not include a space.

# Input:
#   A String (contains some words)
# Output:
#   A hash
#   - Keys are the word lengths
#   - Values are the number of words with the corresponding word length

# Examples:
# word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
# word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
# word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
# word_sizes('') == {}

# Data:
# The string given as input
# - Split string into words
# - Probably iterate over words and construct the hash using each
#   word's length

# Algorithm:
# Given a string as input, str:
# Initialize a new hash, word_size_counts = Hash new (default value 0)
# Split str into words. 
# Iterate over words. For each word:
#   Calculate the word's length, then access the corresponding key-value pair 
#   in word_size_counts and increment the value by 1
# Return word_size counts

def word_sizes(str)
  str.split.each_with_object(Hash.new(0)) do |word, size_counts|
    size_counts[word.length] += 1
  end
end



p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}

