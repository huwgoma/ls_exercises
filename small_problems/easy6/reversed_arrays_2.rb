# Reversed Arrays Part 2
=begin
Write a method that takes an Array and returns a new Array w/ the elements of 
the original list in reverse order.
- Do not modify the original list.
You may not use #reverse or #reverse!, nor the method used in the previous 
question.

# Input: An Array 
# Output: A NEW Array containing the same elements as the input Array but 
#   with elements in reverse order.
# Rule: Dont use reverse or reverse!, or the last method we wrote

# Examples:
reverse([1,2,3,4]) == [4,3,2,1]          # => true
reverse(%w(a b e d c)) == %w(c d e b a)  # => true
reverse(['abc']) == ['abc']              # => true
reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
list.object_id != new_list.object_id  # => true
list == [1, 3, 2]                     # => true
new_list == [2, 3, 1]                 # => true

# Data: 
#   The input Array 
#   The output Array that we will build element by element
#     - Probably add elements one by one to the front of the array

# Algorithm:
# Given an array containing elements, array:
#   Initialize a new empty array, result = []
#   Iterate through array. For each element:
#     Add the element to the FRONT of the result array
# Return array
=end

def reverse(array)
  array.each_with_object([]) do |element, result|
    result.unshift(element)
  end
end


p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true