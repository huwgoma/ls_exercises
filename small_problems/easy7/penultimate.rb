# The End is near but not here
# Write a method that returns the second-last word in the given string.
# - Words are any sequence of non-blank characters (space-separated)
# - Assume that the input string will always have at least two words.

# Input: 
#   A String (contains at least 2 words; words are space-separated)
# Output: 
#   A new(?) String containing the second-last word in the input String

# Examples:
# penultimate('last word') == 'last'
# penultimate('Launch School is great!') == 'is'

# Data: 
#   The input String - probably split this up into words (split on spaces)

# Algorithm:
# Given an input string, str:
# Split str into its words (split on spaces)
# Return the second-last element from words (index -2)

def penultimate(str)
  str.split[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'

# Further Exploration: Edge Cases
# - Strings with just one word; strings with no words

# Write a method that returns the middle word of a sentence. 
# Edge Cases:
#   - Strings with just one word => Return the one word
#   - Strings with an even # of words? => Which side of the divide to return?
#     word1 | word2 -> Return word1 or word2? Neither is technically 'middle'
#     - Return both words (as one string)
#   - Strings with no words (eg. empty string) => Return empty string

# Algorithm:
# Given a string as input, str:
# If str is empty (strip whitespace first), return empty str
# Split str into its words (splitting on spaces)
# Retrieve the "middle" word from words:
#   If words has an odd number of words, return the word at index size / 2
#     eg. [a b c] => 3 / 2 => [a b c][1] => b
#   If words has an even number of words, return the two words at index size / 2
#     and (index size / 2) - 1
#     eg. [a b c d] => 4/2 => c; 4/2-1 => b ([b, c]) 
#     Join the array of two strings into one (with space)
#   Return the middle word

def middle(str)
  return '' if str.strip.empty?

  words = str.split
  middle = if words.size.odd?
             (words.size / 2)..(words.size / 2)
           else
             ((words.size / 2) - 1)..(words.size / 2)
           end
  words[middle].join(' ')
end


p middle('middle') == 'middle'
p middle('i am groot') == 'am'
p middle('hello world') == 'hello world'
p middle('i am a tree') == 'am a'
p middle(' ') == ''