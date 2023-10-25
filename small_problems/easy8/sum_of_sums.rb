# Sum of Sums
# Write a method that takes an Array of numbers and returns the sum of the sums
#   of each leading subsequence for that array. 
#   - Assume the Array always contains at least one number.

# Input:
#   an Array of integers
# Output:
#   An integer representing the sum of the cumulative sums (running total sums)
#     of the sequence.
#   eg. [1, 2, 3] => 1 + (1+2) + (1+2+3) => 10

# Examples:
# sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
# sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
# sum_of_sums([4]) == 4
# sum_of_sums([1, 2, 3, 4, 5]) == 35

# Data: 
#   The array of numbers given as input
#   - Probably need to iterate over each integer
#   - Keep track of some running total?
#   - ie. 0
#     1 + 0; 2 + 1; 3 + 3; etc.

# Algorithm:
# Given an array of integers as input, integers:
# Initialize a new variable running_total = 0
# Initialize a new array sums = []
# Iterate through integers. For each integer:
#   Increment running total by adding the current integer to its old value
#   Add the new value of running_total to sums
# Calculate the sum of sums array's integers

def sum_of_sums(integers)
  running_total = 0

  integers.each_with_object([]) do |int, sums|
    sums << running_total += int
  end.sum
end

# With #reduce
def sum_of_sums(integers)
  running_total = 0

  integers.reduce(0) do |sum_of_sums, int|
    sum_of_sums += (running_total += int)
  end
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35