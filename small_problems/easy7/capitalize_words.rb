# Capitalize Words
# Write a method that takes a single String argument and returns a new String
# containing the original string's value, with the first character of every 
# word capitalized and all other letters in that word lowercased.
# "word"s are any sequence of non-blank characters (space-separated).

# Input: A String 
# Output: A NEW String - same value as the input String, but each word
#   is capitalized (first character upcased, all other chars downcased)
#   - Words are space-separated

# Examples:
# word_cap('four score and seven') == 'Four Score And Seven'
# word_cap('the javaScript language') == 'The Javascript Language'
# word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

# Data:
#   The String given as input - probably will need to iterate over the characters
#   The new string that we will build and return as output

# Algorithm:
# Given a String as input, str:
#   Split str into its words (split on spaces).
#   (Transformation) Iterate over words. For each word:
#     Downcase characters, then upcase first character in the word.
#   Join the resulting array together with a space.

def word_cap(str)
  str.split.map(&:capitalize).join(' ')
end

# Further Exploration: Do not use #capitalize.
# Algorithm: 
# Given a String as input, str:
#   Split str into words (split on spaces)
#   Transformation - Iterate over words. For each word:
#     Downcase all characters
#     Upcase the first character (destructively))
#   Returns array
#   Join the returned array with space.

def word_cap(str)
  str.split.map do |word|
    word.downcase!
    word[0] = word[0].upcase
    word
  end.join(' ')
end

# Further Exploration 2: Another method that does not use #capitalize
# Algorithm: 
# Given a String as input, str:
#   Split str into words (on spaces)
#   (Transformation) Iterate through words. For each word:
#     Iterate over the current word's characters with index. For each char:
#       If index is 0, upcase the character (destructively)
#       Otherwise, downcase the character (destructively)
#     => Returns an array of characters either up/downcased
#     Join the array of characters back into a word
#     Return the word from the block
#   => Returns an array of words 
#   Join the array of words back together into a sentence (join with spaces)

def word_cap(str)
  str.split.map do |word|
    word.chars.each_with_index do |char, index|
      char.downcase!
      char.upcase! if index.zero?
    end.join
  end.join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
