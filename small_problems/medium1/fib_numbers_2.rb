# Fibonacci Numbers (Procedural)

# Every recursive method can be rewritten as a non-recursive (PROCEDURAL) method.

# Rewrite the recursive fibonacci method so it does not use recursion.
# def fibonacci(n)
#   return 1 if n <= 2
#   fibonacci(n - 1) + fibonacci(n - 2)
# end

# Input: An integer representing the position of the fibonacci number we want
# Output: The fibonacci number at the given position

# Examples:
# fibonacci(20) == 6765
# fibonacci(100) == 354224848179261915075
# fibonacci(100_001) # => 4202692702.....8285979669707537501

# Data:
#   The integer given as input, representing the position (index + 1) of the
#   desired fibonacci number
#   - May need to create an array of the fibonacci sequence up to the given n
#     value (size of the array is equal to n)
#   eg. fib(5) => [0, 1, 1, 2, 3, 5]

# Algorithm:
# Given an integer <n> as input, representing the position of the desired fib no.:
# Create an array, fib numbers = []
# Iterate from 1 up to <n>. For each iteration i = 1, i++, 1 -> n:
#   If i is equal to 1 or 2, add 1 to fib numbers.
#   Otherwise, fib number = last 2 elements of fib numbers array
#   - Calculate that number and then add it to fib numbers array
# => An array of fib numbers, up to n (fib numbers contains n # of elements)
# - Return the last number from fib numbers (which will be the nth number)

def fibonacci(n)
  fib_numbers = [0, 1, 1]
  return fib_numbers[n] if n <= 2

  3.upto(n) do
    fib_numbers << fib_numbers.last(2).sum
  end
  fib_numbers.last
end

p fibonacci(0) == 0
p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501

# Refactor Algorithm:
#   Initialize fib numbers array with first 0-2 numbers already set = [0, 1, 1]
#   If n is less than 2, return either 0 or 1, depending on which number is given
#   (Does nto work for negative n but also don't accept negatives)
#   
#   Iterate from 3 up to <n>. For each number:
#     Get the last 2 numbers from fib numbers and sum them
#     Add the new number to fib numbers
#   Return the last element of fib numbers