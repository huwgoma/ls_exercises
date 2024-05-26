# Update each_cons so that it takes another argument, specifying how many 
# elements to pass at a time.

# Input:
# - An array
# - An integer, representing the number of elements to pass to the block.

# Output: 
# - Returns nil
# - Passes n number of elements to the given block at a time.

# Examples:
# n = 2 - [1,3] [3,6] [6,10]
# hash = {}
# each_cons([1, 3, 6, 10], 2) do |value1, value2|
#   hash[value1] = value2
# end
# hash == { 1 => 3, 3 => 6, 6 => 10 }

# n = 3 - [1, 3, 6] [3, 6, 10]
# hash = {}
# each_cons([1, 3, 6, 10], 3) do |value1, *values|
#   hash[value1] = values
# end
# hash == { 1 => [3, 6], 3 => [6, 10] }

# n = 5 - no possible slices of 5
# hash = {}
# each_cons([1, 3, 6, 10], 5) do |value1, *values|
#   hash[value1] = values
# end
# hash == {}


# Data:
# - The array given as input
# - Iterate through each element of the array - but exclude the 
#   last ? elements.
#   - n = 2 exclude last 1; n = 3 exclude last 2; n = 4 exclude last 3; etc.
#   - Therefore: Exclude the last (n-1) elements.
# - Yield the current element, along with the next (n-1) elements in an array
#   to the block.

# Algorithm:
# Given an array, integer (n), and block as input:
# Iterate through the array, excluding the last (n-1) elements. 
# - eg [1, 3, 6, 10], n = 3:
#   - Exclude last 2 elements. only iterate [1, 3]
#   - [1, 3, 6, 10].slice(0..-3)
#   - Therefore: Iterate through array, from index 0 to index -n

# For each element:
# - create an array containing the next (n-1) elements
#   eg. [1, 3, 6, 10], n = 3:
#   - current element is 1 - next (3-1) elements: array[idx+1, n-1]
# - yield the current element + the array of future elements to the block
# EOI => Return nil

def each_cons(array, n)
  array[0..-n].each_with_index do |element, index|
    yield(*array.slice(index, n))
  end
  nil
end

hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
p hash == {}