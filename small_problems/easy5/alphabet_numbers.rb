# Alphabetical Numbers
# Write a method that takes an Array of Integers between 0 and 19 and returns
#   an Array of those Integers, sorted based on the English words for each no.:

# Input: 
#   Array of Integers between 0 and 19.
# Output: 
#   A new Array containing the same Integers, sorted by the 
#     String representations of those numbers (eg. 2 => 'two')

# Example:
# alphabetic_number_sort((0..19).to_a) == [
#   8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
#   6, 16, 10, 13, 3, 12, 2, 0
# ]

# Data: 
#   The input Array [0..19]
#   The output Array [0..19], elements sorted based on the (English) 
#     Strings for each number.
#     -eg. 'eight' ... 'zero'

# Algorithm:
# Given an Array of Integers 0-19, numbers:
#   Create a conversion Hash; keys -> numbers; values -> strings
#   Sort numbers by the converted string form.
#     For each number:
#       Convert current number to its string form via the hash
#       Return that string form (to sort_by)     
#   Return the new array (returned from sort by)

NUMBER_STRINGS = [
  'zero', 'one', 'two', 'three', 'four', 
  'five', 'six', 'seven', 'eight', 'nine', 
  'ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 
  'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen'
]

def alphabetic_number_sort(numbers)
  numbers.sort_by { |num| NUMBER_STRINGS[num] } 
end

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

# Further Exploration: 
# Why didn't we use Array#sort_by! instead of Enumerable#sort_by ?
# #sort_by! mutates and returns the calling Array; the wording of the 
#   problem seemed to imply that we were supposed to return a new Array 

# Further Exploration: Using Enumerable#sort
# Algorithm:
# Given an input Array of integers 0-19, numbers:
#   Iterate through the array (sort). For each PAIR of numbers, a & b:
#     Retrieve the corresponding number string for a and b.
#     Compare a-string and b-string; return -1, 0, or 1.
#   #sort will return a new Array containing the sorted elements.

NUMBER_STRINGS = [
  'zero', 'one', 'two', 'three', 'four', 
  'five', 'six', 'seven', 'eight', 'nine', 
  'ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 
  'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen'
]

def alphabetic_number_sort(numbers)
  numbers.sort do |a, b|
    NUMBER_STRINGS[a] <=> NUMBER_STRINGS[b]
  end
end

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]