# Multiply All Pairs
# Write a method that takes 2 arrays (each containing a list of numbers) and
#   returns a new array containing the product of every possible combination of
#   number pairs between the two arrays' elements.
#   - The returned array should be sorted in ascending order
#   - Assume that neither argument is an empty array

# Input: 
#   Two Arrays, each containing 1 or more integers 
#   - Number of elements is not necessarily identical
# Output:
#   A new Array containing the products of all pair permutations between the 
#     two given arrays.
#   - Output array should be sorted in ascending order

# Examples:
# multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
#   2 * 4 => 8
#   2 * 3 => 6
#   2 * 1 => 2
#   ...

# Data: 
#   The two given arrays of integers
#   The output array of pair products.

# Algorithm:
# Given two arrays of integers, arr1 and arr2:
# Initialize a new empty array, products = []
# Iterate through arr1. For each integer from arr1:
#   Iterate through arr2. For each integer from arr2:
#     Multiply the current arr2 integer with the current arr1 integer
#     => Product. Add the product to the products array
# Sort products and then return it.

def multiply_all_pairs(arr1, arr2)
  products = []
  arr1.each do |int1|
    arr2.each { |int2| products << int1 * int2 }
  end
  products.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

# Using #product:
# Array#product returns an array of subarrays containing all possible element 
#   combinations from the calling array and the given array(s)
#   eg. [1, 2].product([3, 4])
#   #=> [[1, 3], [1, 4], [2, 3], [2, 4]]

# Algorithm:
# Given two arrays of integers, arr1 and arr2:
# Calculate a nested array containing all possible integer combinations from 
#   arr1 and arr2.
# Iterate over the nested array. For each subarray (int combination):
#   (Transformation) Iterate over the subarray and compute the total product
#     of the integers in that subarray (reduce)
#   => Array of product integers
#   Sort the array of product integers and return the sorted array

def multiply_all_pairs(arr1, arr2)
  arr1.product(arr2).map { |ints| ints.reduce(:*) }.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]