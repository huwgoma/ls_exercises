# Letter Counter (Part 2)
# Modify the method from Letter Counter Part 1 to exclude non-letters when
#   calculating word size.
#   eg. it's -> 3 instead of 4.

# Input:
#   String containing words (space-separated)
# Output: 
#   Hash containing key-value pairs representing 
#   word length and # of occurrences of that length in the string

# Examples:
# word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
# word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
# word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
# word_sizes('') == {}

# Data: 
#   String - Probably split into an array of words 
#     split on spaces still 
#   Hash - to be returned; keys represent word length; values represent
#     number of occurrences of that length

# Algorithm:
# Given an input String, str:
#   Split str into an array of words (split on spaces)
#   Initialize a new Hash object; set default values to 0.
#   Iterate through words. For each word:
#     Calculate the word length, using only the alphabetical characters
#       Initialize an array of alphabetical characters (a-z, A-Z)
#       Iterate through the characters of the current word. For each char:
#         If the current character is included in alphabet, add 1 to length
#     Increment the corresponding key value pair by 1.
#   Return the hash


def word_sizes(str)
  words = str.split
  words.each_with_object(Hash.new(0)) do |word, sizes|
    length = word.count('a-zA-Z')
    sizes[length] += 1
  end
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}