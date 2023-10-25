# All Substrings
# Write a method that returns a list of all substrings in a string
# - Returned list should be ordered by the starting location of the substring
#   ie. substrings starting at character 1 should be first, then char 2, etc.
# - Substrings starting from the same character should be ordered shortest to longest

# Use the leading_substrings method from the previous exercise
# def leading_substrings(str)
#   str.length.times.map { |i| str.slice(0..i) }
# end

# Input: A String
# Output: An Array containing all possible substrings in the given string
# - Organization rules;
#   - All substrings starting at index n, n+1, n+2, etc.
#   - For all substrings starting at index n, order them from shortest to longest
#   eg. a, ab, abc

# Examples:
# substrings('abcde') == [
#   'a', 'ab', 'abc', 'abcd', 'abcde',
#   'b', 'bc', 'bcd', 'bcde',
#   'c', 'cd', 'cde',
#   'd', 'de',
#   'e'
# ]

# Data: 
# The string given as input - probably will need to iterate over the string 
#   (as a whole, not chars)
# The array of substrings that we will build and return

# Algorithm:
# Given a string as input, str:
# Initialize a new array, substrings = []
# Iterate over the string; initialize a loop and counter = 0. For each iteration:
#   Take a slice from the string - (string length - counter) times
#     eg. if counter = 0 and string length = 5, take a slice 5 times
#     Slices should start from index counter and progressively get longer 
#       by 1 character each time. 
#     Add slices to substrings
#   Increment counter; exit when counter >= string length
# Return substrings post-iteration

def substrings(str)
  substrings = []
  counter = 0
  loop do
    (str.length - counter).times do |i|
      substrings << str.slice(counter, i + 1)
    end
    counter += 1
    break if counter >= str.length
  end
  substrings
end

# Refactor:
# Loop string length # of times (i = 0). For each loop:
#   Loop (string length - counter) # of times (count = 0). For each loop:
#     Take a slice from the string, starting from index i, ranging until
#       index i + count
#     Add sliced substring to array
# Return array

def substrings(str)
  substrings = []
  str.length.times do |index| 
    (str.length - index).times do |count|
      substrings << str.slice(index..(index + count))
    end
  end
  substrings
end

# Refactor: Use the #leading_substrings method from the previous exercise
def leading_substrings(str)
  str.length.times.map { |i| str.slice(0..i) }
end
# Returns an array of substrings starting from index 0 of given string


# Algorithm:
# Given a string as input, str:
# Initialize a new empty array, substrings = []
# Initialize a loop for <string length> times (index = 0); for each loop:
#   Slice str starting from current index, ranging until the last index of str.
#     Pass that slice of str to leading_substrings method
#     => An array of the substrings starting from index 0 of the given string
#     Add that array to substrings
# Flatten substrings and return it 

def substrings(str)
  substrings = []
  str.length.times do |index|
    substrings << leading_substrings(str.slice(index..-1))
  end
  substrings.flatten
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]