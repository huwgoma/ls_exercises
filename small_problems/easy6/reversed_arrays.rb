# Reversed Arrays (Part 1)
# Write a method that takes an Array as an argument and reverses its elements in
# place (ie. it mutates the given array, then returns the same array object)
# - Do not use #reverse/#reverse!

# Input: An array containing whatever elements
# Output: The same array object with elements in reverse order

# Examples:
# list = [1,2,3,4]
# result = reverse!(list)
# p result == [4, 3, 2, 1] # true
# p list == [4, 3, 2, 1] # true
# p list.object_id == result.object_id # true

# list = %w(a b e d c)
# p reverse!(list) == ["c", "d", "e", "b", "a"] # true
# p list == ["c", "d", "e", "b", "a"] # true

# list = ['abc']
# p reverse!(list) == ["abc"] # true
# p list == ["abc"] # true

# list = []
# p reverse!(list) == [] # true
# p list == [] # true

# Data:
# The array given as input
# - For any array of size n, we only need to perform n / 2 (round down) swaps.
# eg. For an array of size 7, we only need to perform 3 swaps.
# [1, 2, 3, 4, 5, 6, 7]
# => [7, 2, 3, 4, 5, 6, 1] => [7, 6, 3, 4, 5, 2, 1] => [7, 6, 5, 4, 3, 2, 1]

# eg. For an array of size 6, we only need to perform 3 swaps.
# [1, 2, 3, 4, 5, 6]
# => [6, 2, 3, 4, 5, 1] => [6, 5, 3, 4, 2, 1] => [6, 5, 4, 3, 2, 1]

# Algorithm:
# Given an array as input:
# Determine how many swaps we need (n = array size divided by 2)
# Loop n times. For each loop, i = 0:
#   Swap the elements at index i and index -i - 1
# Return array

def reverse!(array)
  swaps_needed = array.size / 2
  swaps_needed.times do |index|
    tail_index = -index - 1
    array[index], array[tail_index] = array[tail_index], array[index]
  end
  array
end

list = [1,2,3,4]
result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

list = []
p reverse!(list) == [] # true
p list == [] # true

