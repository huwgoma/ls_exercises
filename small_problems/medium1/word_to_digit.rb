# Word to Digit
# Write a method that takes a string as input and returns the same string 
# with any sequence of the words zero, one, two, ..., nine converted to a 
# string of digits.

# Input: A String containing a sentence (space-separated words)
# Output: The same string, but any instances of number words (eg. 'one')
#   are replaced with the corresponding string digit.

# Example:
# str = 'Please call me at five five five one two three four. Thanks.'
# word_to_digit(str) == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

# Data: 
#   The string given as input 
#   - Maybe split string into words?
#   Maybe use gsub!
#   - gsub! requires a pattern (regex)
#   /\b#{var}\b/ - Matches `var` (containing some word) in a longer string
#   Probably need some data structure to hold the word-digit conversions
# 



# Algorithm:
# Given a string as input, sentence:
# Create a hash DIGITS to store the word-digit conversions
#   eg. { 'one' => '1' }

# Go through sentence one word at a time. For each word:
#   If the current word is one of the keys in DIGITS, replace it
#     with the corresponding value from DIGITS[word] 
#     eg. 'five' is a key in DIGITS; replace 'five' with DIGITS['five'] => '5'
#   (Modify sentence in place)

# Digits Approach:
#   Iterate through DIGITS; For each key-value pair:
#     Run through sentence and replace all instances of the key with the value
#   Return sentence

# Without gsub!:
# Split sentence into words. Iterate through words; for each word:
#   Clean the current word (non-destructive) 
#   - Remove the last character if it is non-alphabetic.
#   If the cleaned word is a key in DIGITS, replace the current word
#     with the corresponding digit 
# * You can give String#[]= a substring, and it will replace the first matching
#   substring with the new string.

#     - only the part of the word that matches the key.
#     eg. 'four.' => 'four' (clean; original still 'four.')
#         'four.'['four'] => '4' => '4.'
#  => Array of words, numbers -> digits
#   Join array of words to a string (new string tho)

DIGITS = ['zero', 'one', 'two', 'three', 'four', 'five',
  'six', 'seven', 'eight', 'nine'].zip(Array('0'..'9')).to_h

ALPHABET = Array('a'..'z') + Array('A'..'Z')

# Using gsub! and regex
def word_to_digit(str)
  DIGITS.each do |word, digit|
    str.gsub!(/\b#{word}\b/, digit)
  end
  str
end


def word_to_digit(str)
  str.split.each do |word|
    cleaned_word = clean_word(word)
    if DIGITS.key?(cleaned_word.downcase)
      word[cleaned_word] = DIGITS[cleaned_word.downcase]
    end
  end.join(' ')
end

def clean_word(word)
  chars = word.chars
  chars.pop until ALPHABET.include?(chars.last)
  chars.join
end

str = 'Please call me at five five five one two three four. Thanks.'
p word_to_digit(str) == 'Please call me at 5 5 5 1 2 3 4. Thanks.'