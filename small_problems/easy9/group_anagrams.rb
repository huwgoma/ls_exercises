# Group Anagrams
# Given this array:
# words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
#           'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
#           'flow', 'neon']

# Write a program that prints out groups of words that are anagrams
# - Anagram: Same characters, different order
# eg. 
# ["demo", "dome", "mode"]
# ["neon", "none"]
# (etc)

# Input:
#   An array of strings
# Output:
#   Printing arrays of all strings that are anagrams of each other

# Example:
# words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
#           'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
#           'flow', 'neon']
# group_anagrams(words)
# Print -> ['demo', 'dome, 'mode']
#       -> ['neon, 'none']
#       -> ['fowl', 'flow']
#       etc.

# Data: 
#   The words array given as input
#   individual anagram arrays
#   - maybe create a hash?
#   key: 'demo' (sorted) => value: ['demo', 'dome', 'mode']

# Algorithm:
# Given an array of strings as input, words:
# Initialize a new hash, anagrams = {}
# Iterate through words. For each word:
#   Split the word into an array of its characters
#   Sort the array of characters
#   Join the sorted array of characters back together into a string
#   Add the WORD (unmodified) to the array associated with the sorted STRING
#     key in anagrams
#     - If the anagrams hash contains the sorted STRING key already, add the WORD
#       to the associated value array
#     - If anagrams does not yet contain the STRING key, assign that key to a 
#       new array containing the current WORD

#     eg. 'mode' => [m, o, d, e] =(sort)> [d, e, m, o] => 'demo'
#     anagrams['demo'] << 'mode'
#   * Words that are anagrams will each create a sorted array that is identical to
#     each other
# Iterate through anagrams and print out all anagram arrays that have more than 
#   1 element.

def print_anagrams(words)
  anagrams = list_anagrams(words)
  anagrams.each_value do |words|
    p words if words.length > 1
  end 
end

def list_anagrams(words)
  words.each_with_object({}) do |word, anagrams|
    letters = word.chars.sort.join
    if anagrams.key?(letters)
      anagrams[letters] << word
    else
      anagrams[letters] = [word]
    end
  end
end


words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

print_anagrams(words)
