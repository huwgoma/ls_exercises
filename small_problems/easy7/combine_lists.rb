# Combine Two Lists
# Write a method that takes two Arrays passed in as arguments and returns a new 
# Array that contains all elements from both given Arrays.
# - Elements should be taken in alternation (interleaved); the first element
# should come from the first array.
# - Assume that both input Arrays are non-empty and contain the same number of 
# elements.

# Input: Two Arrays - non-empty, contain the same # of elements
# Output: One (new) Array - contains all elements from both input arrays combined 
#   in interleaving order (eg. 121212...)

# Examples:
#   interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

# Data: Two arrays given as input
#     The output array that we will build and return

# Algorithm:
# Given two arrays with the same # of elements, arr1 and arr2:
#   Initialize a new empty array, result = []
#   Initialize a loop and a counter = 0; for each iteration:
#     Retrieve the value at index <counter> from arr1 and add it to result
#     Do the same thing but from arr2, add to result
#     Increment counter by 1
#     Exit the loop when counter >= arr1 size

#   Return result array once we're done looping

def interleave(arr1, arr2)
  result = []
  counter = 0
  while counter < arr1.size
    result.push(arr1[counter], arr2[counter])
    counter += 1
  end
  result
end

# Further Exploration: Using #zip
# Array#zip returns a new Array containing nested subarrays. Each subarray contains
#   the elements at index <n> of the calling Array and all other given Arrays, where
#   <n> is the index of that subarray.
#   eg. [1, 2, 3].zip(['a', 'b', 'c'])
#       => [[1, 'a'], [2, 'b'], [3, 'c']]
#   Subarray at index 0 contains the elements at index 0 from both arrays.

# Zip arr1 and arr2
# Flatten the resulting array.

def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']