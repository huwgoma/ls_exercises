# Rotation (Part 1)
# Write a method that rotates an array by moving the first element to the 
# end of the array. 
#   Do not mutate the original Array
#   Do not use Array#rotate or #rotate!

# Input:
#   An Array containing some elements (not necessarily)
# Output:
#   A new Array containing the same elements, but with the 
#   first element moved to the last position

# Examples:
# rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# rotate_array(['a']) == ['a']
# rotate_array([]) == []

# x = [1, 2, 3, 4]
# rotate_array(x) == [2, 3, 4, 1]   # => true
# x == [1, 2, 3, 4]                 # => true

# Data:
#   The Array that is given as input; do not mutate
#   The new Array that we want to build and return

# Algorithm:
# Given an Array as input, array:
#   Create a shallow copy of array and save it to array_copy
#     Empty Case: Return array copy if it's empty
#   Remove the first element from array copy 
#   Add that element back to array copy (at the end of the array)
#   Return array_copy

# Without cloning
# Given an Array as input, array:
#   (Transform) Iterate over array (with index). For each element:
#   Retrieve the element at the next index; if the next index is out of bounds, 
#     then retrieve the element from the first index
#   => Array of elements shifted one index over
# Return that new array

def rotate_array(array)
  array_copy = array.dup
  return array_copy if array_copy.empty?

  array_copy << array_copy.shift
end

def rotate_array(array)
  array.map.with_index do |element, index|
    array.fetch(index + 1, array.first)
  end
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true



# Further Exploration:
# Write a method that rotates a String. You may use #rotate_array.

# Input: A String
# Output: A new String containing the same characters, but with the first
#   character rotated to the end of the string

# Examples:
# rotate_string('string') == 'trings'
# rotate_string('s') == 's'
# rotate_string('') == ''

# str = 'hello world'
# p rotate_string(str) == 'ello worldh'
# p str == 'hello world'

# Data:
#   The String given as input
#     - May convert to an array of characters
#   The new String that we will build and return

# Algorithm:
# Given a String as input, str:
#   Split str into an array of its characters.
#   Rotate the array; move the first element (character) to the last index
#     => Array of characters but rotated
#   Join the array of rotated characters back together into a string and return
#     the string.

def rotate_string(str)
  rotate_array(str.chars).join
end

p rotate_string('string') == 'trings'
p rotate_string('s') == 's'
p rotate_string('') == ''

str = 'hello world'
p rotate_string(str) == 'ello worldh'
p str == 'hello world'



# Further Exploration #2: Write a method that rotates an Integer
# Input: Integer
# Output: Also an integer, but with the first digit moved to the last digit

# Example:
# rotate_integer(123) == 231
# rotate_integer(0) == 0
# rotate_integer(-123) == -231
#   How to handle negatives?
#   - Keep the negative but rotate the first digit to last anyways
#   eg. -123 => -231

# Data: 
#   The Integer given as input
#   - Probably split into an array of its digits

# Algorithm:
# Given an integer as input, int:
#   If int is negative, set negative flag to true
#   Convert int into an array of its digits using the absolute value 
#     - Make sure digits are in the right order
#   Rotate the array of digits (first digit to last digit place)
#   => Array of digits, rotated
#   Join the array back together into a string, then convert to integer.
#     If int was negative, multiply the resulting integer by -1; otherwise, by 1

def rotate_integer(int)
  sign = int.negative? ? -1 : 1
  rotated_digits = rotate_array(int.abs.digits.reverse)
  remove_leading_zeros!(rotated_digits)
  
  rotated_digits.join.to_i * sign
end

# Integers cannot have leading 0s; after converting int to digits and rotating
# digits, remove any leading 0s before converting back into an integer

def remove_leading_zeros!(digits)
  digits.shift while digits.first == 0
end

p rotate_integer(123) == 231
p rotate_integer(0) == 0
p rotate_integer(-123) == -231
p rotate_integer(102) == 21 # Can't have integers leading with 0
p rotate_integer(1002) == 21
