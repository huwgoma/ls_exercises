# Write a method that takes an optional block. 
# If the block is specified, the method should invoke it, then return the
#   value returned from the block.
# If no block is given, the method should simply return the string 
#   'Does not compute.'

# Input: An optional block
# Output: 
# - The block's return value (if given)
# - "Does not compute." (otherwise)

# Example:
# compute { 5 + 3 }     #=> 8
# compute { 'a' + 'b' } #=> 'ab'
# compute               #=> 'Does not compute'

# Algorithm
# Given an optional block as input:
# Check if a block was given
# - If true, yield to the block, then return the block's return value
# - If false, return "Does not compute."

# def compute
#   block_given? ? yield : 'Does not compute.'
# end

# p compute { 5 + 3 }     #=> 8
# p compute { 'a' + 'b' } #=> 'ab'
# p compute               #=> 'Does not compute'
# p compute { }           #=> nil 

# Further Exploration: 
# Modify #compute so it takes a single argument and yields that argument to the
# block. Provide at least 3 examples of this new #compute, including a no-block call.


def compute(arg)
  block_given? ? yield(arg) : 'Does not compute.'
end

p compute(5) { |num| num + 1 }      #=> 6
p compute('Ah') { |str| str + '!' } #=> Ah!
p compute('no block')               #=> 'Does not compute.'
p compute('empty block') { }        #=> nil
