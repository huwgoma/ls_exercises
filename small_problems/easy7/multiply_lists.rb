# Multiply Lists
# Write a method that takes two Arrays - each array contains a list of numbers - 
#   then returns a new array containing the product of the numbers at each index
#   eg. [1, 2, 3] x [3, 2, 1] => [3, 4, 3]

# Input: Two Arrays containing a list of numbers
# - Assume that the two arrays will have the same # of elements
# Output: One Array containing the same # of elements
# - Each element is the product of the numbers at the indexes of the two
#   given arrays.

# Examples:
# multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

# Data: 
#   The two arrays given as input - both containing <n> # of integers
#   The array that we will build and return as output - also containing <n> 
#     # of integers.

# Algorithm:
# Given two arrays containing integers as input, arr1 and arr2:
#   Transformation: Iterate over arr1 with index. For each integer:
#     Multiply the current integer (arr1) with the integer at the 
#       current index in arr2.
#     => Integer product
#     Add this integer product to our returned array.

def multiply_list(arr1, arr2)
  arr1.map.with_index do |int, index|
    int * arr2[index] 
  end
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

# Further Exploration: Using #zip.
# #zip returns a nested array of subarrays, where each subarray contains the 
#   elements of the calling array and all other arrays at that index.
#   eg. [3, 5, 7].zip([9, 10, 11])
#   #=> [[3, 9], [5, 10], [7, 11]]

# Algorithm:
# Given two arrays of integers, arr1 and arr2:
# Zip the two arrays together to return an array of nested subarrays
#   Each subarray contains the numbers at that index from arr1 and arr2
# Map over the top-level array. For each subarray:
#   Calculate the product of the integers within each subarray
#     Initialize product = 1 
#     Iterate through the subarray. For each integer:
#       Increment product by multiplying product x integer
#   => product integer
#   add product integer to array
# Return array

def multiply_list(arr1, arr2)
  arr1.zip(arr2).map { |subarr| subarr.reduce(&:*) }
end


p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]