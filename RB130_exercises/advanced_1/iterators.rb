# Internal Iteration:
# - The implementation of iterating through a collection is hidden from the user.

# External Iteration: 
# - Iteration that occurs at the user's discretion.

# Create a new Enumerator object.
# - When a new Enumerator is instantiated, we can define what values are iterated
#   over.
# - Create an Enumerator that can iterate over an infinite list of factorials.
# - Test this Enumerator by printing out the first 7 factorials starting with 0!.
#   - Print the first 7 factorials using external iteration.
#   - What happens if you print 3 more? 
#   - Reset the Enumerator (with rewind)
#   - Print 7 more factorials.

# Enumerator::produce
# - Creates an infinite enumerator from a block. 
# - The result of the previous iteration is passed to the next one.
#   - If an initial argument is provided, it is passed to the first iteration,
#     and becomes the first element of the enumerator.
#   - Otherwise, the first iteration receives nil, and its result is the first 
#     element of the iterator.

# Enumerator::new
# - Creates a new Enumerator object.
# - Iteration is defined by the block.
#   - A "yielder" object (block parameter) yields (returns) a value 
#     by calling the yield / << method.

# Factorials:
# 0! and 1! are hardcoded to equal 1.
# All subsequent factorials are equal to multiplying n by the previous factorial.
#   eg. 2! == 2 * 1! => 2; 3! == 3 * 2! => 6
# 2! => 2   3! => 6   4! => 24

# Initialize a new variable, index = 0.
# factorial = 1

# For each iteration:
# - If index is less than 2, factorial remains unchanged (1)
# - Otherwise, factorial = index * factorial.
# - Add factorial to y (whatever y is)
# - Increment index by 1.

factorials = Enumerator.new do |yielder|
  index, factorial = 0, 1
  
  loop do
    factorial *= index unless index < 2
    yielder << factorial
    index += 1  
  end
end

# External Iteration 
# Print the first 7 factorials.
7.times { puts factorials.next }
# => 1, 1, 2, 6, 24, 120, 720

# Print the next 3 factorials.
3.times { puts factorials.next }
# => 5040, 40320, 362880

# Rewind the Enumerator
factorials.rewind

# Print 7 more factorials.
7.times { puts factorials.next }
# => 1, 1, 2, 6, 24, 120, 720