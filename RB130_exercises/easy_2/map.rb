# Enumerable#map iterates over a collection and returns a new array, using the
# values returned from the given block for each element.

# Write a method called map that takes an array as an argument and a block, and
# returns a new array containing the return values produced by the block for 
# each element.
# - If the array is empty, map should return an empty array.
# - You may use each, eachw/object, eachw/index, reduce, loop, for, while, or
#   until to iterate, but not any other iterative methods.

# Input:
# - An array + a block (implicit)
# Output:
# - a new array with array.size elements, containing the return values of each
#   block invocation.

# Examples:
# map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
# map([]) { |value| true } == []
# map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
# map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
# map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]

# Data:
# - Array given as input
# - Iterate through the array
#   - yield each element to the block
#   - add the return value to new array
# - Return new array

# Algorithm:
# Given an array and block as input:
# Initialize a new results array = []
# Iterate through array. For each element:
# - yield the current element to the block
# - add the block's return value to results
# Return results

def map(array)
  # Return Enumerator if no block given...
  array.each_with_object([]) do |element, results|
    results << yield(element)
  end
end

# With reduce
# def map(array)
#   array.reduce([]) do |results, element|
#     results << yield(element)
#   end
# end

p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
p map([]) { |value| true } == []
p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]

p map({ a: 1, b: 2, c: 3}) { |key, value| "#{key}: #{value * 2}" } == ["a: 2", "b: 4", "c: 6"]