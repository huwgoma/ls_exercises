# Enumerable#all? iterates over a collection and yields each element to a block;
# If the block returns a falsey value, it will stop iterating and return false.
# Otherwise (end of iteration; every element returns truthy), it returns true.
# If the array is empty, all? returns true (by default)
# - true by default, until false 

# Do not use all?, any?, none?, or one?

# Input: An array and an implicit block
# Output: A boolean - true by default, unless the block returns falsey for
#   any element.

# Examples:
# all?([1, 3, 5, 6]) { |value| value.odd? } == false
# all?([1, 3, 5, 7]) { |value| value.odd? } == true
# all?([2, 4, 6, 8]) { |value| value.even? } == true
# all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
# all?([1, 3, 5, 7]) { |value| true } == true
# all?([1, 3, 5, 7]) { |value| false } == false
# all?([]) { |value| false } == true

# Algorithm:
# Given an array as input, array:
# Iterate over each element of the array. For each ele:
#   - Yield the current element to the block. 
#   - If the return value of the block is falsey, return false
# Otherwise (end of iteration), return true.

def all?(array)
  array.each do |element|
    value = yield(element) if block_given?
    return false unless value
  end
  true
end

p all?([1, 3, 5, 6]) { |value| value.odd? } == false
p all?([1, 3, 5, 7]) { |value| value.odd? } == true
p all?([2, 4, 6, 8]) { |value| value.even? } == true
p all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p all?([1, 3, 5, 7]) { |value| true } == true
p all?([1, 3, 5, 7]) { |value| false } == false
p all?([]) { |value| false } == true