# Find Missing Numbers
# Write a method that takes a sorted array of integers and returns an array that
# includes all missing integers (in order) between the first and last 
# elements in the given argument.

# Input: 
# - A sorted array of integers (not necessarily consecutive)

# Output: 
# - A new? array of integers containing all integers between the given array's
#   first (min) and last (max) integer
# - Integers are in order (min->max)

# Examples:
# missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
# missing([1, 2, 3, 4]) == []
# missing([1, 5]) == [2, 3, 4]
# missing([6]) == []

# Algorithm:
# Given an array of integers (assume sorted, min->max):
# - Iterate a range from first to last integer. For each int:
#   - Select the current integer if it is missing from integers
# - Return selection 

# def missing(integers)
#   (integers.first..integers.last).reject do |int|
#     integers.include?(int)
#   end
# end

# p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
# p missing([1, 2, 3, 4]) == []
# p missing([1, 5]) == [2, 3, 4]
# p missing([6]) == []




# Further Exploration: Solve this without using a method that requires a block.
# Algorithm:
# Given an array of integers (assume sorted, min->max):
# - Create an array of all numbers between integers' first(min) and last (max)
# - Subtract the given integers array from the full array
# - Return the result

def missing(integers)
  (integers.first..integers.last).to_a - integers
end


p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []