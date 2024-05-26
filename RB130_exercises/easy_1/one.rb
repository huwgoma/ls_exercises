# Enumerable#one?
# one? iterates over the calling collection and yields each element to the given 
#   block. If the block returns truthy for -exactly- one element, #one? returns
#   true; otherwise, false.
# one? stops searching the collection the second time the block returns true.

# Input: An array and a block
# Output: A boolean
# - true if the block returns truthy for exactly one element; false otherwise
# - Returns false by default (if array is empty)

# Examples:
# one?([1, 3, 5, 6]) { |value| value.even? } == true
# one?([1, 3, 5, 7]) { |value| value.odd? } == true
# one?([]) { |value| true } == false

# Algorithm: 
# Given an array and block as input:
# Initialize a new variable, count = 0
# Iterate through each element of the array. For each element:
# - yield the current element to the block.
# - if the block return value is truthy, increment count by 1.
# - if count is greater than 1, exit iteration 
# End of iteration:
# - If count == 1, return true; otherwise, return false.

def one?(array)
  count = 0
  array.each do |element|
    count += 1 if yield(element)
    break if count > 1
  end
  count == 1
end

p one?([1, 3, 5, 6]) { |value| value.even? }    == true
p one?([1, 3, 5, 7]) { |value| value.odd? }     == false
p one?([2, 4, 6, 8]) { |value| value.even? }    == false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p one?([1, 3, 5, 7]) { |value| true }           == false
p one?([1, 3, 5, 7]) { |value| false }          == false
p one?([]) { |value| true }                     == false