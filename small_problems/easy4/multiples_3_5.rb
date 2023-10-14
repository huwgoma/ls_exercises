# Multiples of 3 and 5
# Write a method that searches for all multiples of 3 OR 5, that lie between 1
# and a given number, then returns the sum of those multiples.

# Input: Integer, representing the number to search up to (inclusive)
# - Assume that the input is an integer greater than 1.
# Output: Another integer, representing the sum of all numbers between 1 and 
#   the input number that are divisible by either 3 or 5 (or both).

# eg.
# multisum(20)
# Numbers between 1 and 20 that are divisible by 3 OR 5:
#   3, 5, 6, 9, 10, 12, 15, 18, 20 => (sum) => 98

# Data:
#   Probably an Array (store the numbers that will contribute to the sum)

# Algorithm:
# Given an Integer representing the number to search up to (for multiples), int:
#   Create a new empty array, multiples = []
#   Create a new array of all integers between 1 and the given number, numbers.
#   Selection: Select all integers from numbers that are evenly divisible by 
#     3 OR 5, and add them to multiples
#   Sum multiples and return sum.

# def multisum(int)
#   numbers = Array(1..int)
#   multiples = numbers.select do |int| 
#     (int % 3).zero? || (int % 5).zero?
#   end
#   multiples.sum
# end

# with #upto
# Initialize a new integer, sum = 0
# Iterate from 1 up to the given number. For each number:
#   If the current number is evenly divisible by 3 or 5, add it to sum;
#   otherwise, do nothing.
# Return sum

# def multisum(int)
#   sum = 0
#   1.upto(int) do |i|
#     sum += i if (i % 3).zero? || (i % 5).zero?
#   end
#   sum
# end

# With reduce:
# Given an integer representing the number to search up to, int:
#   Create an array of all integers between 1 and the given number, numbers
#   Iterate through numbers. For each number:
#   Starting from 0, add the current number to sum IF current number is 
#     divisible by 3 or 5.

def multisum(int)
  numbers = Array(1..int)
  numbers.reduce(0) do |sum, i|
    sum += i if (i % 3).zero? || (i % 5).zero?
    sum
  end
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168