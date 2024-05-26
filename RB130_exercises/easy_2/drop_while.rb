# Enumerable#drop_while iterates over a collection, passing each element
# to the given block until it finds an element for which the block returns falsey.
# - The remaining elements that have not been iterated over, and the element that
#   resulted in a falsey block return, are collected into an array and returned.

# Write a method called drop_while that behaves similarly for arrays. 


# Input:
# - An array and a block

# Output:
# - A new array
# - contains all elements from the original array, but:
#   - excludes the elements at the start of the array that returned truthy
#     consecutively.
# - If input array is empty, or if the block returns truthy for all elements,
#   return an empty array.

# "Drop elements", while block is truthy.
# - Stop iterating when the block finds the first falsey return.

# Examples:
# drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
# drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
# drop_while([1, 3, 5, 6]) { |value| true } == []
# drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
# drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
# drop_while([]) { |value| true } == []

# Data:
# - The array given as input
# - Iterate through the array
# - yield each element to the array
#   - if the block return is truthy, continue to next element
#   - if the block return is falsey, stop iteration and return the current +
#     remaining elements in an array
# (index?)

# Algorithm:
# Given an array as input:
# Iterate through each element of the array. For each element:
# - yield the current element to the block.
# - If the block returns falsey, stop iterating and return the 
#   rest of the elements.
#   - slice array from current index to end index.
# - If the block returns truthy, continue iterating.
#   - If all elements return truthy, return an empty array.


def drop_while(array)
  array.each_with_index do |element, index|
    return array.slice(index..-1) unless yield(element)
  end
  []
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []