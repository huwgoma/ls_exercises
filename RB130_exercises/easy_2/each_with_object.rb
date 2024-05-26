# Each with object iterates over a collection and passes each element + an object
# given as an argument to the given block.
# - The block's return value is unused.
# - The object given as argument is returned.

# Write your own each_with_object method that takes an array, another object, and
# a block, yields each element + object to the block, and returns the object.
# - If array is empty, it should return the object given.

# Permitted methods;
# #each, #each_with_index, #reduce, loop, for, while, or until


# Input: 
# - An array; object; and block
# Output:
# - The object given as the second argument.


# Examples:
# result = each_with_object([1, 3, 5], []) do |value, list|
#   list << value**2
# end
# result == [1, 9, 25]

# result = each_with_object([1, 3, 5], []) do |value, list|
#   list << (1..value).to_a
# end
# result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]

# result = each_with_object([1, 3, 5], {}) do |value, hash|
#   hash[value] = value**2
# end
# result == { 1 => 1, 3 => 9, 5 => 25 }

# result = each_with_object([], {}) do |value, hash|
#   hash[value] = value * 2
# end
# result == {}


# Algorithm:
# Given an array, object, and block as input:
# Iterate through the array. for each element:
# - yield the current element and the object to the block
# Return the object at EOI.

def each_with_object(array, object, &block)
  # Return enumerator if block not given
  array.each do |element|
    block.call(element, object)
  end
  object
end


result = each_with_object([1, 3, 5], []) do |value, list|
  list << value**2
end
p result == [1, 9, 25]

result = each_with_object([1, 3, 5], []) do |value, list|
  list << (1..value).to_a
end
p result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]

result = each_with_object([1, 3, 5], {}) do |value, hash|
  hash[value] = value**2
end
p result == { 1 => 1, 3 => 9, 5 => 25 }

result = each_with_object([], {}) do |value, hash|
  hash[value] = value * 2
end
p result == {}