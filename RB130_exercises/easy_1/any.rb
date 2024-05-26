# Iterators: True for any?
# Enumerable#any? passes each element in a collection to the given block.
# If the block returns a truthy value for any element, #any? returns true, and
#   stops searching.
# Otherwise, #any? returns false.

# Write a method called any? that behaves similarly, taking an Array as an argument.
# - If the given block returns true for any element, it should return true, and
#   stop iterating.
# - Otherwise (end of iteration), return false.
# - If the array is empty, any? should return false (by default)
# Do not use all? any? none? or one?

# Input: An array and a block
# Output: A boolean - false by default; true if any array element returns 
#   truthy from the block.

# Examples:
# any?([1, 3, 5, 6]) { |value| value.even? } == true
# any?([1, 3, 5, 7]) { |value| value.even? } == false
# any?([2, 4, 6, 8]) { |value| value.odd? } == false
# any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
# any?([1, 3, 5, 7]) { |value| true } == true
# any?([1, 3, 5, 7]) { |value| false } == false
# any?([]) { |value| true } == false

# Algorithm:
# Given an array as input, array, and an implicit block:
# Iterate over each element of array. For each element:
#   - Yield the current element to the block.
#   - If the return value from the block is truthy, return true.
#   - Otherwise, continue iteration
# - If iteration ends, return false.

def any?(array)
  array.each do |element|
    value = yield(element) if block_given?
    return true if value
  end
  false
end

p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false

p any?({ a: 'b', b: 'c' }) { |k, v| v == 'c' }
# element is? [:a, 'b']