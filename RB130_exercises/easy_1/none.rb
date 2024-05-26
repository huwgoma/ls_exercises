# Enumerable#none?
# Iterates over a collection and yields each element to a given block. 
# none? Returns true only if the block returns falsey for every element.
# - If the block returns truthy for any element, #none? stops iterating and 
#   returns false.
# If the array is empty, none? returns true (by default)

# Input: 
# - An array of elements
# Output:
# - A boolean; true by default, false if the block returns truthy for any element.

# Examples:
# none?([1, 3, 5, 6]) { |value| value.even? } == false
# none?([1, 3, 5, 7]) { |value| value.even? } == true

# none?([2, 4, 6, 8]) { |value| value.odd? } == true
# none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
# none?([1, 3, 5, 7]) { |value| true } == false
# none?([1, 3, 5, 7]) { |value| false } == true
# none?([]) { |value| true } == true

# Algorithm:
# Given an array and block as input:
# Iterate over each element of array. For each element:
# - yield the current element to the block.
# - If the return value from the block is truthy, stop iterating and return false.
# Otherwise, end of iteration, return true.

def none?(array)
  # Return Enumerator unless block_given?
  array.each { |ele| return false if yield(ele) }
  true
end


p none?([1, 3, 5, 6]) { |value| value.even? } == false
p none?([1, 3, 5, 7]) { |value| value.even? } == true
p none?([2, 4, 6, 8]) { |value| value.odd? } == true
p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p none?([1, 3, 5, 7]) { |value| true } == false
p none?([1, 3, 5, 7]) { |value| false } == true
p none?([]) { |value| true } == true