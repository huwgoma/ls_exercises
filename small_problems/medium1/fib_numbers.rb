# Fibonacci Numbers (Recursion)
# The Fibonacci series is a sequence of numbers starting with 1 and 1, where 
#   each number is the sum of the 2 previous numbers.
#   - eg. Fib(3) = 1 + 1 => 2; Fib(4) = 1 + 2 => 3; etc.
# Write a method that calculates the nth Fib number

# Input: Integer representing the position of the number we want to return (n)
# Output: The <nth> number of the Fib sequence

# Examples:
# fibonacci(1) == 1
# fibonacci(2) == 1
# fibonacci(3) == 2
# fibonacci(4) == 3
# fibonacci(5) == 5
# fibonacci(12) == 144
# fibonacci(20) == 6765

# Data: 
#   The integer given as input (n)
#  Return the number at position n from the Fib sequence.
#   => Find the number at position n - 1 and the number at position n - 2
#    - First two numbers are always 1 and 1; 
#      - If n == 1 or 2, return 1.

# Algorithm:
# Given an integer, n: 
#   If n <= 2, return 1 (base)
#   Otherwise, recurse.
#     - Call fib again, but with n - 1 and n - 2; sum the results to get fib(n)

def fibonacci(n)
  return 1 if n <= 2
  fibonacci(n - 1) + fibonacci(n - 2)
end


fibonacci(1) == 1
fibonacci(2) == 1
fibonacci(3) == 2
fibonacci(4) == 3
fibonacci(5) == 5
fibonacci(12) == 144
fibonacci(20) == 6765

# Further Exploration:
# For large n numbers, the system has to make a very high number of recursive 
# calls that may eventually exceed the stack size.
# Even if stack size is not exceeded, it just takes too long to calculate high
# n numbers.
