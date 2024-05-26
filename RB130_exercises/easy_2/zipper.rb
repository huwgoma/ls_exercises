# Array#zip takes 2 arrays and combines them into a single array, in which
# each element is a two-element subarray:
# - first element is a value from one array; second element is the value from 
#   the second array at the same index.

# Write your own version of zip that takes 2 arrays as arguments, and returns a new
# array, zipped.

# Input: 
# - 2 arrays
# - Assume both arrays contain the same number of elements
# Output:
# - A new array containing the same number of elements as the first array
# - Each element is a subarray, containing the elements at that index from both
#   arrays.

# Examples:
# zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]

# Data:
# - 2 arrays as input
# - New nested array as output
# - Iterate over the indexes (eg. 1..3)
# - for each index, retrieve the values from arr1 and arr2, create a new subarray, 
#   and push that to the end result array.

# Algorithm:
# Given two arrays as input, arr1 and arr2:
# (transform) Iterate over the indexes of arr1. For each index:
# - Create a subarray with the elements at arr1[index] and arr2[index] (current idx)
# => An array of subarrays where each subarray contains the elements in arr1 and arr2,
#    at its index.

def zip(arr1, arr2)
  (0...arr1.size).map do |index|
    [arr1[index], arr2[index]]
  end
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]