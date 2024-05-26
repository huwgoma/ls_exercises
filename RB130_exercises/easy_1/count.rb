# Count Items
# Write a method that takes an array as an argument, and a block that returns
#   true or false depending on the given array element. The method should return
#   a count of the number of times the block returns true.
# - Do not use Array#count or Enumerable#count in your solution.

# Input:
# - An array
# - A block that returns a boolean

# Output:
# - An integer representing the number of times the block returned true(thy?)

# Examples:
# count([1,2,3,4,5]) { |value| value.odd? } == 3
# count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
# count([1,2,3,4,5]) { |value| true } == 5
# count([1,2,3,4,5]) { |value| false } == 0
# count([]) { |value| value.even? } == 0
# count(%w(Four score and seven)) { |value| value.size == 5 } == 2

# Algorithm:
# Given an array and block as input:
# Initialize a new variable, count = 0
# Iterate through each element of the array. For each element:
# - yield the current element to the given block.
# - Increment count if block returns truthy
# end of iteration:
# - Return count

# def count(array)
#   count = 0
#   array.each { |element| count += 1 if yield(element) }
#   count
# end

# p count([1,2,3,4,5]) { |value| value.odd? } == 3
# p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
# p count([1,2,3,4,5]) { |value| true } == 5
# p count([1,2,3,4,5]) { |value| false } == 0
# p count([]) { |value| value.even? } == 0
# p count(%w(Four score and seven)) { |value| value.size == 5 } == 2


# Further Exploration
# Write a version of `count` that fulfills the same requirements, but does not
# use each, loop, while, or until.
# for?
# For element in array:
# yield element to block; increment count if block return is truthy.

# def count(array)
#   count = 0
#   for element in array
#     count += 1 if yield(element)
#   end
#   count
# end

def count(array)
  array.reduce(0) do |counter, element|
    counter+= 1 if yield(element)
    counter
  end
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2
