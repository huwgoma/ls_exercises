# Leading Substrings
# Write a method that returns a list of all substrings in the given string, 
#   starting at the beginning (first char) of the given string.
#   - Return value should be sorted from shortest to longest 
#   - Substring is defined as any sequence of characters within the string.

# Input: A string
# Output: An array of substrings taken from the input string, sorted from 
#   shortest to longest.

# Examples:
# leading_substrings('abc') == ['a', 'ab', 'abc']
# leading_substrings('a') == ['a']
# leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

# Data:
#   The string given as input
#   The array of substrings that we will build and return.

# Algorithm:
# Given a string as input, str:
# Initialize a new array, substrings = []
# Initialize a loop and counter = 0. For each iteration:
#   Slice the string starting from the first character up to the character at 
#     index counter.
#     Add the sliced substring to substrings.
#   Exit the loop when counter >= str length
# Return substrings

def leading_substrings(str)
  substrings = []
  counter = 0
  loop do
    substrings << str.slice(0..counter)

    counter += 1
    break if counter >= str.length
  end
  substrings
end

# Refactor
def leading_substrings(str)
  substrings = []
  str.length.times do |counter|
    substrings << str.slice(0..counter)
  end
  substrings
end

# Refactor Again
def leading_substrings(str)
  str.length.times.map { |i| str.slice(0..i) }
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']