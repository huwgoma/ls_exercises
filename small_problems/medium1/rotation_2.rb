# Rotation 2
# Write a method that will rotate the last n digits of a number. 
# - Rotating 1 digit will just return the original number
# - You may use the #rotate array method from Rotation 1.
# - You may assume that n is always a positive integer.

# Input: Two integers
#   1) The Integer that we will rotate 
#   2) The number of digits that we want to rotate (starting from the back)
# Output: Another Integer representing the result of rotating the last n (#2)
#   digits

# Examples:
# rotate_rightmost_digits(735291, 1) == 735291
# rotate_rightmost_digits(735291, 2) == 735219
# rotate_rightmost_digits(735291, 3) == 735912
# rotate_rightmost_digits(735291, 4) == 732915
# rotate_rightmost_digits(735291, 5) == 752913
# rotate_rightmost_digits(735291, 6) == 352917

# rotate_rightmost_digits(735291, 5) == 752913
# - Rotate the last 5 digits (35291)
# Rotate: 
# just move the first digit to the back
# 35291 => 52913

# Data: 
#   The Integer (number to rotate) 
#   - Probably split this integer into an array of its digits
#   - Find some way to partition the array of digits to separate out the
#   last n digits. 

# Algorithm:
# Given two integers, int and n:
#   Split int into an array of its digits (in left-right order)
#   Take the last <n> digits from digits (return in a new array)
#   Rotate the array of last n digits 
#   - Move the first digit (element) to the back of the array
#   Replace the last n digits in digits array with the rotated last_n_digits array
#   - Figure out which indexes we want to replace:
#     - Start from index -n
#     - Slice for length n
#   - Assign the new rotated array elements to those indexes
#   Remove any leading 0s
#   Join digits and convert back to integer (return int)

def rotate_array(array)
  array.map.with_index do |element, index|
    array.fetch(index + 1, array.first)
  end
end

def rotate_rightmost_digits(int, n)
  digits = int.digits.reverse
  rotated_digits = rotate_array(digits.last(n))
  digits[-n, n] = rotated_digits
  
  digits.join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917

# Edge Case: Rotating results in leading 0
# nvm to_i seems to take care of this already
p rotate_rightmost_digits(705291, 6) #== 52917
# => 052917 => Strip leading 0s before converting back to int
