# Counting Up
# Write a method that takes an integer and returns an Array of all integers in
#   sequence between 1 and the given integer.
# - Assume that the given integer will always be greater than 0.

# Input: 
#   An Integer (>0)
# Output:
#   An array of integers - starting from 1, ending at the given integer.
#   Elements are progressively incremented by 1

# Examples:
# sequence(5) == [1, 2, 3, 4, 5]
# sequence(3) == [1, 2, 3]
# sequence(1) == [1]

# Data: 
#   The integer given as input
#   The array of integers that we will build and return

# Algorithm:
# Given an end integer, end_int:
# Initialize a new array, integers = []
# Initialize a loop from 1 to end_int. For each iteration:
#   Add the current integer to integers
# Return integers

def sequence(end_int)
  integers = []
  1.upto(end_int) do |int|
    integers << int
  end
  integers
end

def sequence(end_int)
  Array(1..end_int)
end

sequence(5) == [1, 2, 3, 4, 5]
sequence(3) == [1, 2, 3]
sequence(1) == [1]

# Further Exploration:
# What do you think sequence should return if the argument is 0 or negative?
# eg. What should you do if the argument is -1?
# Return an array of all the integers in sequence between 1 and the given argument.
# so, if -1 is given, iterate from 1 to 0 to -1.

# Alter your method to handle this case.
# eg.
# sequence(0) == [1, 0]
# sequence(-1) == [1, 0, -1]

# Algorithm:
# Given an end integer, end_int:
# If end_int is positive, create a range from 1 to end_int and convert to array
# Otherwise, create a range from end int to 1, convert to an array, then reverse

def sequence(end_int)
  if end_int.positive?
    Array(1..end_int)
  else
    Array(end_int..1).reverse
  end
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]


p sequence(0) == [1, 0]
p sequence(-2) == [1, 0, -1, -2]