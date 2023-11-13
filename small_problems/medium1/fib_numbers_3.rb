# Fibonacci Numbers (Last Digit)
# Write a method that returns the last digit of the nth fibonacci number

# Input:
#   An integer representing the position (n) of the fib number we want to return
# Output:
#   Another Integer representing the last digit of the corresponding nth
#   fib number.

# Examples:
# fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
# fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
# fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
# fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
# fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
# fibonacci_last(123456789) # -> 4

# Data: 
#   The integer given as input, n - representing the position of the fib number
#     we want
#   - Once we get the nth fib number we need to return its last digit (place 1)
#   - Split nth number into its digits and return the place 1 digit

# Algorithm:
# Given an integer as input, n, representing the position of the desired fib no.:
# Create a new array, fib numbers = [0, 1, 1]
# - If n is less than/equal to 2, return the corresponding fib number.
# Iterate from 3 (first non-1 fib number) up to n. For each number:
#   Calculate the fib number corresponding to the current number.
#   - ie. Sum the last 2 elements of fib numbers, then add the result to
#         fib numbers.
#   - Stop iterating when we have finished computing the nth fib number
# Retrieve the last element from fib numbers (which will be the nth number)
# Split nth_number into its digits and return the digit at place one

# def fibonacci_last(n)
#   fib_numbers = [0, 1, 1]
#   return fib_numbers[n] if n <= 2

#   3.upto(n) do
#     fib_numbers << fib_numbers.last(2).sum
#   end
  
#   p fib_numbers
#   nth_number = fib_numbers.last
#   nth_number.digits.first
# end





# Refactor Algorithm: Make it work for big numbers
# - Only store the last digit of the last 2 numbers
# eg. [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610]
# last_digit = [0, 1, 1].last
# 2nd_last_digit = [0, 1, 1][-2]

# Iterate from 2 up to n. For each number:
#   Add last digit and 2nd_last_digit.
#   Reassign 2nd_last_digit to last digit, and last digit to the place one digit
#     of the result (of adding last and 2nd last)
# Return last digit

def fibonacci_last(n)
  last, second_last = [1, 1]

  3.upto(n) do
    last_digit = (last + second_last).digits.first
    second_last, last = last, last_digit
  end
  last
end

# p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
# p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
# p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
# p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
# p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
# p fibonacci_last(123456789) # -> 4


# Refactor Algorithm #2: Make it work for any number
# The last digit of the fibonacci sequence numbers follows a pattern:
# - Every 60 numbers, the last digit restarts the sequence of 
#   0, 1, 1, 2, 3, etc...
#   - ie. the 60th number will end with 0, 61 => 1, 62 => 1 etc.
# Therefore:
# Given an integer, n, representing the position of the desired fib number:
#   Divide n by 60 to reduce it to a number between 0 and 59.
# Calculate the nth fib number (0..59)
# Return the last digit of the nth fib number.

def fibonacci_last(n)
  n = n % 60
  nth_fib = fibonacci(n)
  nth_fib.digits.first
end

def fibonacci(n)
  fib_numbers = [0, 1, 1]
  return fib_numbers[n] if n <= 2

  3.upto(n) do |i|
    fib_numbers << fib_numbers.last(2).sum
  end
  fib_numbers.last
end


p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4