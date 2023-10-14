# Running Totals
# Write a method that takes an Array of numbers and returns an Array with the 
# same number of elements, where each element has the running total (?) from the 
# original Array.

# Input:
#   An Array of numbers

# Output: 
#   A new Array - containing the running totals of summing the original
#   array's elements.

# Examples;
# running_total([2, 5, 13]) == [2, 7, 20]
# running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
# running_total([3]) == [3]
# running_total([]) == []

# Data: 
#   Two arrays (the original, and the output array). Probably iterate through
#   the original array 

# Algorithm:
# Given an input array of numbers, numbers:
#   Initialize a new variable, sum = 0 
#   Initialize a new empty array, result = []
#   Transformation: Iterate through numbers. For each number:
#     Add the current number to sum, then add to result
#   Return result array 
# (#map) - also takes care of empty case

def running_total(numbers)
  sum = 0 
  numbers.map { |num| sum += num }
end

# Further Exploration: Using #each_with_object
# Initialize sum = 0 
# Iterate through numbers. For each number:
#   Add the current number to sum, then add to the ewo [] object
# Return ewo [] array

def running_total(numbers)
  sum = 0
  numbers.each_with_object([]) do |num, arr|
    arr << sum += num
  end
end

# Further Exploration: Using #reduce
# Initialize sum = 0
# iterate through numbers, for eahc number:
#   Increment current number to sum, add to reduce memo

def running_total(numbers)
  sum = 0
  numbers.reduce([]) do |arr, num|
    arr << sum += num
  end
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []