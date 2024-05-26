# Enumerable#each_cons - Iterates over a collection, and passes sequences of
# n consecutive elements to the given block. 
# - Return value is nil.

# Write a method called each_cons that takes an array and a block, and passes
# each consecutive pair of elements to the block before returning nil.
# - Permitted: #each, #each_with_object, #each_with_index, #reduce, loop, for, while, 
#   or until

# Input: 
# - An array
# Output: 
# - Passes 2 elements at a time to the block (in an array)
# - returns nil

# Examples:
# hash = {}
# result = each_cons([1, 3, 6, 10]) do |value1, value2|
#   hash[value1] = value2
# end
# result == nil
# hash == { 1 => 3, 3 => 6, 6 => 10 }

# [1, 3, 6, 10] => Pairs are 1, 3; 3, 6; and 6, 10 (not 1, 3; 6, 10)



# [1].each_cons(2) {} => the single element is not processed

# Data:
# - The array given as input
# - Iterate through each element of the array  (exclude the last element)
# - yield the current element and the next element to the block

# Algorithm:
# Given an array and block as input:
# Iterate through the array with index, excluding the last element. 
# For each element:
# - Yield the current element and the next element to the block
# EOI => Return nil.

def each_cons(array)
  array[0..-2].each_with_index do |element, index|
    next_element = array[index + 1]
    yield(element, next_element)
  end
  nil
end



hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}
p result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}
p result == nil