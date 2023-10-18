# Letter Swap
# Given a String of space-separated words, write a method that returns a String 
#   in which the first and last letters of every word are swapped.
# Assume that every word contains at least one letter, and that the String will
#   always contain at least one word. Assume the String contains nothing but 
#   words and spaces.

# Input: 
#   A String of word(s) - words are space-separated (if multiple)
# Output: 
#   A new String containing the same words as the input String, but 
#   each word has its first/last letters swapped.

# Examples:
# swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
# swap('Abcde') == 'ebcdA' # only one word
# swap('a') == 'a' # only one letter

# Data: 
#   The String given as an input; probably split this string into 
#     an Array of words (split on spaces)
#   The new String that we need to construct and return

# Algorithm:
# Given an input String of space-separated words, str:
#   Split the String into an array of 'words', splitting on spaces.
#   (Transform) Iterate through words. For each word:
#     Create a new String that is the current word, but with the first and 
#       last letters swapped. (Return this string from the block)
#   # => A new Array containing n number of string objects (n = string.split size)
#        where each string has its first/last letters swapped from the original 
#        string array.
#   Join the returned array together into a String, join using space
#   Return the resulting string.

def swap(str)
  words = str.split
  words.each do |word|
    word[0], word[-1] = word[-1], word[0]
  end
  words.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'

# Further Exploration: 
def swap_first_last_characters(word)
  word[0], word[-1] = word[-1], word[0]
  word
end

def swap(words)
  result = words.split.map do |word|
    swap_first_last_characters(word)
  end
  result.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'

# Why is `word` passed into the #swap_first_last_characters method?
# Why not just pass the characters that need to be swapped? 
# eg.
# def swap_first_last_characters(a, b)
#   a, b = b, a
# end

# swap_first_last_characters(word[0], word[-1])

# This implementation would not work for two main reasons:
# 1) Reassignment is not destructive, but String indexed assignment is.
# In our original implementation, we are using String#[]= to mutate the 
# word that is passed in. 
# In the hypothetical new implementation, we would just be swapping the 
# values of the `a`and `b` pointers, without mutating the current value of 
# `word`.

# 2) String retrieval returns the character(s) as a new String, meaning that 
# even if we were to mutate the Strings referenced by `a` and `b`, it would not
# have any effect on the `word` String.

