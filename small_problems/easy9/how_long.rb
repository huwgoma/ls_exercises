# How long are you?
# Write a method that takes a string and returns an array containing every word 
#   from the string.
#   - Each word should have a space and the word's length appended.
#   - Assume that the words are separated by exactly 1 space
#   - Assume that any sequence of non-space characters is a word.

# Input:
#   A string
# Output:
#   An array of strings, where each string contains a 'word' from the input 
#     string, with a space and the word length appended

# Examples:
# word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

# word_lengths("baseball hot dogs and apple pie") ==
#   ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

# word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

# word_lengths("Supercalifragilisticexpialidocious") ==
#   ["Supercalifragilisticexpialidocious 34"]

# word_lengths("") == []


# Data: 
#   The string given as input - will split into an array of words
#   The array that we will build and return (may map over words array)

# Algorithm:
# Given a string as input, str:
# Split str into an array of words (split on spaces)
# (Transform) Iterate over words. For each word:
#   Append a space and the current word length to word and return the 
#     resulting string
# => Array of transformed words

def word_lengths(str)
  str.split.map { |word| "#{word} #{word.length}" }
end

p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []