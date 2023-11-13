# Rotation (Part 3)
# Rotate 735291 to the left => 352917
# Lock the first digit and rotate the remaining digits => 3 29175
# Then lock the first 2 digits and rotate remaining => 32 1759
# Lock first 3 digits, rotate remaining => 321 597
# Lock first 4 digits, rotate remaining => 3215 79 (maximum rotation)
# (Lock first 5 digits, rotate remaining) => 32157 9

# Input: Integer
# Output: A new integer representing the maximum rotation of the input integer
# - Do not have to handle multiple 0s

# Examples:
# max_rotation(735291) == 321579
# max_rotation(3) == 3
# max_rotation(35) == 53
# max_rotation(105) == 15 # the leading zero gets dropped
# max_rotation(8_703_529_146) == 7_321_609_845

# Data: 
#   The Integer given as input
#   - Need to rotate the integer multiple times (-1 digit each time)
#   8 703 529 146 => 703 529 146 8
#   7 3529146 80 => 73 29146 805 => 732 146 8059
#   => 7321 6 80594 => 73216 05948 => 732160 9485
#   => 7321609 854 => 73216098 45 
#   => 732160984 5
# 1) Full rotation (digits size)
# each subsequent rotation is with 1 less digit count

# Algorithm:
# Given an integer, int, as input:
# Calculate the # of digits (digits size)
# Initialize a loop and counter = digits size. For each iteration:
#   Rotate the last <digits size> digits => Return a rotated int
#   Subtract 1 from digits size 
#   Break the loop when digits size = 1


# ds = 5; int => 329175
# ds = 4; int => 321759
# ds = 3; int => 321597
# ds = 2; int => 321579;

# def max_rotation(int)
#   digit_count = int.digits.size

#   digit_count.downto(1) do |n|
#     int = rotate_rightmost_digits(int, n)
#   end
#   int
# end

# def rotate_array(array)
#   array.map.with_index do |element, index|
#     array.fetch(index + 1, array.first)
#   end
# end

# def rotate_rightmost_digits(int, n)
#   digits = int.digits.reverse
#   rotated_digits = rotate_array(digits.last(n))
#   digits[-n, n] = rotated_digits
  
#   digits.join.to_i
# end

# p max_rotation(735291) == 321579
# p max_rotation(3) == 3
# p max_rotation(35) == 53
# p max_rotation(105) == 15 # the leading zero gets dropped
# p max_rotation(8_703_529_146) == 7_321_609_845

# Further Exploration: Multiple consecutive 0s 
# - Preserve 0s, but strip leading 0s
# Source of problem: Rotate right digits method
# - It's stripping leading 0s and returning an integer on every iteration of 
#   max rotation's block
#   Thus if at any point the integer has any leading 0s, they will be stripped
#   prematurely 
# - Solution involves keeping digits as an array and only converting it back to an
# integer at the end

def max_rotation(int)
  digits = int.digits.reverse

  digits.size.downto(1) do |n|
    digits = rotate_rightmost_digits(digits, n)
  end
  digits.join.to_i
end

def rotate_array(array)
  array.map.with_index do |element, index|
    array.fetch(index + 1, array.first)
  end
end

def rotate_rightmost_digits(digits, n)
  digits[-n, n] = rotate_array(digits.last(n))
  digits
end

# Refactor rotate_right_digits:
#  take an array of digits and also return an array of digits (rotated)
# Refactor max-Rotation's block:
#   a rotated array of digits is returned instead of an int
#   save the rotated array of digits and pass it to rotate_right again, just
#   changing the n value (-1)

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845

p max_rotation(70052) == 5720
p max_rotation(700) == 70

# 70052 => 00527
# 0 5270
# 05 702
# 057 20 
# 05720 => 5720

# 70052 => 00527 => 527