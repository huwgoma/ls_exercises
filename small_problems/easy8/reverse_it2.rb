# Reverse It (Part 2)
# Write a method that takes a string containing one or more words and returns the 
#   same string with words that contain 5 or more characters reversed.
# - Assume that each string will only contain letters and spaces, and will
#   only contain spaces when more than one word is present.

# Input: 
#   A String
# Output:
#   The same string with words longer than 5 chars reversed (mutation)

# Examples:
# puts reverse_words('Professional')          # => lanoisseforP
# puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
# puts reverse_words('Launch School')         # => hcnuaL loohcS

# Data: 
#   The string given as input
#   - Probably will need to split string into words?

# Algorithm:
# Given a string as input, str:
# Divide str into words (spaces)
# (transformation) Iterate over words. For each word:
#   If word length is greater than/equal to 5, reverse the word
#   otherwise return word from block
# => Array of words (some reversed)
# Join the array of words back together with spaces
# Replace the contents of str with the contents of the new string (retain old 
#   string object id)

def reverse_words(str)
  reversed = str.split.map do |word|
    word.length >= 5 ? word.reverse : word
  end.join(' ')
  str.replace(reversed)
end

# Refactor: Without #replace
# Initialize a variable keeping track of each word's start, start = 0
# Split str into its words (on spaces)
# Iterate over words. For each word:
#   If the current word is greater than/equal to 5 characters, reverse the 
#     current word and assign the corresponding indexes in str to the result.
#     ie. 'Launch School'
#     start = 0 ; Launch.length = 6 
#     => str[0, 6] = hcnuaL
#   Update start by incrementing it by length + 1(space) (?)

# 'Walk around the block'
# start = 0
# Walk.length = 4; not greater than 5. 
# start += 4+1 = 5

# around.length = 6; > 5.
# str[5, 6] = dnuora
# start += 7 => 12

# the.length = 3; not > 5
# start += 4 => 16

# block.length = 5; >= 5
# str[16, 5] = kcolb
# start += 6 => 22

def reverse_words(str)
  start = 0
  str.split.each do |word|
    str[start, word.length] = word.reverse if word.length >= 5
    start += (word.length + 1)    
  end
  str
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS



