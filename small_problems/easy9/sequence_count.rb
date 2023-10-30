# Sequence Count
# Write a method that takes 2 integers. The first argument is a count
#   and the second is the first number of a sequence that your method will create
# The method should return an Array containing the same # of elements as the 
#   count argument
#   - The values of the array should be multiples of the starting number

# - Assume that count will always have a value of 0 or greater
#   - If count = 0, return an empty array
# - Assume that the starting number can be any integer value

# Input:
#   2 Integers
#   1) A 'count' of how many elements are in the returned array
#   2) The first number of the returned array
# Output: 
#   An array:
#   - Contains `count` #  of elements
#   - Starts with `first number`
#   - Each element is a multiple of `first_number`
#   eg. 2, 4, 6, 8, etc.

# Examples:
# sequence(5, 1) == [1, 2, 3, 4, 5]
# sequence(4, -7) == [-7, -14, -21, -28]
# sequence(3, 0) == [0, 0, 0]
# sequence(0, 1000000) == []

# Data:
#   The array that we will build and return
#   count: array size
#   first_num: first array element

# Algorithm:
# Given two integers, count and first_num:
# Initialize a new empty array, sequence = []
# Loop `count` number of times (i = 0..4). For each loop:
#   Multiply first_num by i + 1 and add the result to sequence
# Return sequence

def sequence(count, first_num)
  sequence = []
  count.times do |i|
    sequence << first_num * (i + 1)
  end
  sequence
end

# Refactor with Range
# Given two integers, count and first_num:
# Create a range from 1..count
# (Transform) Iterate over the range (1..count). For each integer:
#   Transform the current integer; multiply current integer by first_num 
# => Array of transformed integers

def sequence(count, first_num)
  (1..count).map { |int| int * first_num }
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []