# Enumerable#count iterates over a collection and passes each element to the 
# associated block; it then returns the number of elements for which the block
# returns a truthy value.

# Write a method called count that behaves similarly for an arbitrarily long
# list of arguments. It should take 0 or more arguments and a block, and return
# the total number of arguments for which the block returns true.
# - Iterate through list of arguments and yield each argument to the block
# - Increment count if truthy
# - If argument list is empty, count should return 0

# each, each w object, each w index, reduce, loop, for, while, and until
# are permitted - no other iterative methods.


# Input:
# - 0 or more arguments *
# - collect these stray arguments into an array with the splat
# - block

# Output:
# - An integer representing the number of arguments for which the given block
#   returns a truthy value

# Examples:
# count(1, 3, 6) { |value| value.odd? } == 2
# count(1, 3, 6) { |value| value.even? } == 1
# count(1, 3, 6) { |value| value > 6 } == 0
# count(1, 3, 6) { |value| true } == 3
# count() { |value| true } == 0
# count(1, 3, 6) { |value| value - 6 } == 3

# Data:
# - arbitrary list of arguments, collected into an array
# - iterate through array of args. for each arg, yield to block
# - increment count by 1 if block return is truthy.

# Algorithm
# Given an arbitrary list of arguments:
# Collect all arguments into an array (*)
# Initialize a new variable, count = 0
# Iterate through arguments. For each arg:
# - yield the current arg to a block
# - increment count by 1 if block return is truthy
# EOI => Return count

def count(*args)
  args.reduce(0) do |counter, arg|
    counter+= 1 if yield(arg)
    counter
  end
end

p count(1, 3, 6) { |value| value.odd? } == 2
p count(1, 3, 6) { |value| value.even? } == 1
p count(1, 3, 6) { |value| value > 6 } == 0
p count(1, 3, 6) { |value| true } == 3
p count() { |value| true } == 0
p count(1, 3, 6) { |value| value - 6 } == 3