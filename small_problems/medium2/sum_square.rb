# Sum Square - Square Sum
# Write a method that takes an integer n and calculates the difference between the
# square of the sum of the first n positive integers, and the sum of the squares
# of the first n positive integers.

# Input: An Integer, n
# - Represents the endpoint of our square sum/sum square calculations
# - Iterate up to n
# Output: Another Integer
# - Represents the difference (subtraction) between the square of sums and 
#   sum of squares (up to n)

# Square of the sum of the first n (positive) integers:
#   If n = 3; square(1 + 2 + 3) => 36
# Sum of the squares of the first n (positive) integers:
#   If n = 3; sum(1sq + 2sq + 3sq) => 14

# Examples:
# sum_square_difference(3) == 22
#    # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
# sum_square_difference(10) == 2640
# sum_square_difference(1) == 0
# sum_square_difference(100) == 25164150

# Data:
#   - The integer n given as input - acts as endpoint for iteration
#   - Iterate up to n
# Maybe 2 separate variables:
# sum = 0; square_sum = 0
#   Then for each integer up to n, add int to sum and add int squared to sq_sum
#   Square sum at end

# Algorithm:
# Given an integer <n> as input:  (first <n> positive integers ie. start at 1)
# Initialize 2 new variables: sum = 0 and sum_of_squares = 0
# Iterate from 1 up to n. For each integer, int:
#   Increment sum by int.
#   Increment sum_of_squares by int squared
# Calculate the square of sum's value
# Calculate the difference between square of sums and sum of squares

def sum_square_difference(n)
  sum, sum_of_squares = 0, 0
  1.upto(n) do |int|
    sum += int
    sum_of_squares += int ** 2
  end
  square_of_sums = sum ** 2
  square_of_sums - sum_of_squares
end

p sum_square_difference(3) == 22
  # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150