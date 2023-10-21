# Fibonacci Number Location By Length

# Write a method that calculates and returns the index of the FIRST 
#   Fibonacci number that has the given number of digits.
#   - Assume that the argument is always greater than/equal to 2.
#   - The first Fib number has index 1.
#     (In an Array, it has index 0, so we need to add 1 to the result)

# Input: Integer representing the number of digits in the Fib number we want 
#   to return
# Output: An integer representing the index of the
#  -first- Fib number with the given # of digits

# Examples:
# find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
# find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
# find_fibonacci_index_by_length(10) == 45
# find_fibonacci_index_by_length(100) == 476
# find_fibonacci_index_by_length(1000) == 4782
# find_fibonacci_index_by_length(10000) == 47847

# 2 => [1, 1, 2, 3, 5, 8, 13] - Stop at 13 and return the index of 13 in this 
#   array sequence => 6 (add 1 because the first number starts at 1) => 7

# Data:
#   Input: Our Integer representing the number of digits to stop at 
#   Probably build an Array containing the Fib numbers ([1, 1] default)

# Algorithm: 
# Given an Integer representing the # of digits of the desired Fib number, digits:
#   Initialize an Array containing the fib numbers, fib = [1, 1]
#   Initialize a loop:
#     Calculate the next fib number in the sequence:
#       Sum the previous 2 numbers in fib
#     Add the result fib number to the fib array
#     Check if the fib number we just calculated matches the given # of digits.
#       If true, exit the loop; otherwise, continue looping
#   Get the index of the last character, add 1 to it, and return that number
#   ie. Return the size of the array (bc size is = to index + 1).

def find_fibonacci_index_by_length(digits)
  fib_numbers = [1, 1]
  loop do
    next_fib_num = fib_numbers[-2, 2].sum
    fib_numbers << next_fib_num

    break if next_fib_num.digits.size >= digits
  end
  fib_numbers.size
end

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847