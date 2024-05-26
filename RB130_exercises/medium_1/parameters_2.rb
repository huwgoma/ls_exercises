# Parameters 2

# Write a method that takes an array as an argument. The method should yield the 
#   array contents to a block, which should assign the block parameters such that
#   it ignores the first two elements of the array, and groups all remaining
#   elements in a `raptors` array.

# Input:
# - An array
# - a block
# Output/Behavior:
# - variable output, depending on the block
# - yields each array element to block individually
#   - block captures all elements but the first 2 in raptors [] array.

# Example:
# ignore the first 2 array elements
# raptors(['raven', 'finch', 'hawk', 'eagle', 'osprey']) do |_, _, *raptors|
#   puts raptors
# end
#=> hawk
#=> eagle
#=> osprey

# Algorithm:
# Given an array and block as input:
# yield the array elements to the block
# - the block should ignore the first 2 elements, then capture the remaining
#   elements in a raptors array.

def group_raptors(birds)
  yield(birds)
end


group_raptors(['raven', 'finch', 'hawk', 'eagle', 'osprey']) do |_, _, *raptors|
  puts raptors
end
#=> hawk
#=> eagle
#=> osprey