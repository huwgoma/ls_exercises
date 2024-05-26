# #each_with_index iterates over a collection and passes each element, and its index,
# to the given block. The block's return value is not used; each w/ index returns
# the original collection (same object)

# Write your own version of #each_with_index. 
# #each, #each_with_object, #reduce, loop, for, while, or until are permitted;
# no other iterators.

# Input:
# - An array and a block
# Output: 
# - Returns the given array (argument)

# Examples;
# result = each_with_index([1, 3, 6]) do |value, index|
#   puts "#{index} -> #{value**index}"
# end

# puts result == [1, 3, 6]
# 0 -> 1
# 1 -> 3
# 2 -> 36
# true

# Algorithm:
# Given an array and block as input:
# Initialize a new variable, index = 0
# Iterate through the array. For each element:
# - yield the current element and index to the block
# - increment index
# Return the array

def each_with_index(array)
  index = 0
  array.each do |element|
    yield(element, index)
    index += 1
  end
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]