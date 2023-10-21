# Reversed Arrays (Part 1)

=begin
Write a method that takes an Array as an argument and reverses its element in place
(Mutate the argument Array and return that same array)
- Do not use #reverse or #reverse!

Input: 
  An Array containing whatever elements
Output: 
# The same Array but with its elements reversed

Examples:
  list = [1,2,3,4]
  result = reverse!(list)
  result == [4, 3, 2, 1] # true
  list == [4, 3, 2, 1] # true
  list.object_id == result.object_id # true

  list = %w(a b e d c)
  reverse!(list) == ["c", "d", "e", "b", "a"] # true
  list == ["c", "d", "e", "b", "a"] # true

  list = ['abc']
  reverse!(list) == ["abc"] # true
  list == ["abc"] # true

  list = []
  reverse!(list) == [] # true
  list == [] # true

Data: 
  The Array given as input; also the same array we will mutate and return

Algorithm:
# Given an Array of elements, array:
# Initialize a loop and counter = 0; for each loop:
#   Swap the element at index counter and the element at the other end of the arr
#     "other end" -> arr[0] and arr[-1]; arr[1] and arr[-2]; etc.
#   Increment counter by 1
#   Break the loop if counter >= array size / 2 (check this first tho)
# return array


=end
def reverse!(array)
  counter = 0
  until counter >= array.size / 2
    end_index = -counter - 1
    array[counter], array[end_index] = array[end_index], array[counter]
    counter += 1 
  end
  array
end


list = [1,2,3,4]
result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

list = []
p reverse!(list) == [] # true
p list == [] # true