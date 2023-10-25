# Array Average
# Write a method that takes an arrray of integers and returns the average of all
# numbers in the array.
#   - Assume that the array will never be empty and the numbers are all positive
#   integers.
# The result should also be an integer.
#   - Do not use Array#sum

# Input: An array of integers
# Output: An integer representing the sum average of all numbers in the array.

# Examples:
# puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
# puts average([1, 5, 87, 45, 8, 8]) == 25
# puts average([9, 47, 23, 95, 16, 52]) == 40

# Data:
#   The array of integers given as input
#   - Will need to iterate over the array and calculate the sum of ints

# Algorithm:
# Given an array of integers, integers:
# Initialize a variable, sum = 0
# Iterate over integers. For each integer:
#   Increment sum by adding the current integer to sum
# Divide sum by the number of elements in integers.

def average(integers)
  sum = 0
  integers.each do |int|
    sum += int
  end
  sum / integers.size
end

def average(integers)
  integers.reduce(:+) / integers.size
end

def average(integers)
  sum = integers.reduce(0) { |sum, int| sum += int }
  sum / integers.size
end

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

# Further Exploration: Returning a float instead of Int
def average(integers)
  integers.reduce(:+).fdiv(integers.size)
end

puts average([1, 6]) == 3.5 
puts average([1, 5, 87, 45, 8, 8]) #== 25.666666668
puts average([9, 47, 23, 95, 16, 52]) #== 40.333333333