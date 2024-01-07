require 'pry'

# Longest Sentence:
# Write a program that reads the contents of a text file, then prints the
# longest sentence in the file (based on number of words), as well as the number
# of words in that longest sentence.
# - Sentences end with periods, exclamation marks, or question marks.
# - Words are any sequence of characters that are not spaces or 
#     sentence-ending punctuation characters.

# Hint: If you have a variable `str` containing multiple sentences, you can 
#   create an array of sentences by splitting on all sentence-enders (. ? !)
# eg. sentences = str.split(/\.|\?|!/)

# Input: A text file
# Output:
# - The longest sentence in the file (most WORDS (not characters))
# - The number of words in that sentence

# Example:
# But, in a larger sense, we can not dedicate, we can not
# consecrate, we can not hallow this ground. The brave
# men, living and dead, who struggled here, have
# consecrated it, far above our poor power to add or
# detract. The world will little note, nor long remember
# what we say here, but it can never forget what they
# did here. It is for us the living, rather, to be dedicated
# here to the unfinished work which they who fought
# here have thus far so nobly advanced. It is rather for
# us to be here dedicated to the great task remaining
# before us -- that from these honored dead we take
# increased devotion to that cause for which they gave
# the last full measure of devotion -- that we here highly
# resolve that these dead shall not have died in vain
# -- that this nation, under God, shall have a new birth
# of freedom -- and that government of the people, by
# the people, for the people, shall not perish from the
# earth.

# The longest sentence is this:
# It is rather for
# us to be here dedicated to the great task remaining
# before us -- that from these honored dead we take
# increased devotion to that cause for which they gave
# the last full measure of devotion -- that we here highly
# resolve that these dead shall not have died in vain
# -- that this nation, under God, shall have a new birth
# of freedom -- and that government of the people, by
# the people, for the people, shall not perish from the
# earth.
# -> 86 words long. (each -- counts as a word)

# Data:
# - The contents of the text file - save to a string variable
# - Split the string variable into an array of SENTENCES (splitting on
#   the sentence-ending punctuations)
# - Split each sentence into words (splitting on spaces) and counting the 
#   number of words in each sentence
# - Print the longest sentence (including spaces and punctuation *)

# Algorithm:
# Given a text file, <file>.txt:
# Load the contents of the text file into a new variable, txt:
# - File.new (filepath) ?
# Split txt into an array of SENTENCES 
# - Split on all occurences of . ? or !
# (Sort) Iterate through sentences. For each sentence:
#   Remove newline characters and replace with space
#   Split the sentence into an array of words (split on spaces)
#   Count the number of words in that sentence
#   - Sort sentences by number of words
# Print the last (longest) sentence in the sorted sentences array

txt = File.read('longest_sentence.txt')
sentences = txt.split(/\.|\?|!/)

longest_sentence = sentences.max_by do |sentence|
  sentence.split.size
end

number_of_words = longest_sentence.split.size

puts longest_sentence
puts number_of_words







# Further Exploration: Keep the punctuation at the end of the sentence?

# String#split: If the provided RegEx contains *GROUPS*, the matching delimiters
#   are included in the returned array.
# eg. '1.2!3?'.split(/(\.|\!|\?))/) => ['1', '.', '2', '!', '3', '?']
# Divide the punctuation-split array into subarrays of 2 elements
#   eg. ['sentence', <sentence-ending punctuation>].

# - Enumerable#each_slice: Iterates over the calling Array <n> elements at a time, 
#   where n is the given integer argument. 
#   eg. [1, 2, 3, 4].each_slice(2) { |array| p array }
#       => [1, 2]; [3, 4]
#   or: [1, 2, 3, 4].each_slice(2) { |a, b| p a + b }
#       => 3(1+2); 7(3+4)

# # v1
# # sentences = text.split(/(\.|\?|\!)/).each_slice(2).map do |sentence, punctuation|
# #   sentence + punctuation
# # end
# # v2
# # sentences = text.split(/(\.|\?|\!)/).each_slice(2).map do |array|
# #   array.join
# # end
# # v3

# (Transformation) Iterate over each subarray. For each subarray:
#   Join the subarray elements (sentence + punctuation) together into a string.
# => An array of the text, split into sentences, with the punctuation joined back
#    to the end of the sentence.
# Everything else is the same:
# - Find the longest sentence by the number of words (split on spaces)

text = File.read('longest_sentence.txt') 
sentences = text.split(/(\.|\?|\!)/).each_slice(2).map(&:join)
longest_sentence = sentences.max_by { |sentence| sentence.split.size }
longest_length = longest_sentence.split.size

puts longest_sentence
puts longest_length



# Further Exploration: Finding the longest paragraph
# Paragraphs are delimited by two consecutive new lines (\n\n)
# So, given a text file's contents:
# Split the text file on double newline instead of punctuation
# => Array of paragraphs
# Then find the paragraph with the greatest number of words (split on spaces)
text = File.read('longest_sentence.txt')
paragraphs = text.split("\n\n")
longest_paragraph = paragraphs.max_by { |paragraph| paragraph.split.size }
longest_length = longest_paragraph.split.size

puts longest_paragraph
puts longest_length


# Further Exploration: Finding the longest word
# Words are delimited by spaces
# So, given a text file's contents as a string:
# Split the string on spaces (and punctuation?) => Array of words
# Find the word with the most number of characters.
text = File.read('longest_sentence.txt')
words = text.split
longest_word = words.max_by(&:size)
longest_length = longest_word.size
puts longest_word
puts longest_length