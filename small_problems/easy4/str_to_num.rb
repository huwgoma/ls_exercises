# Convert String to Number
# Write a method that takes a String of digits and returns the corresponding
# integer. 
# - Do not use #to_i or Integer.

# Do not worry about leading +/- signs or invalid characters - assume all 
#   characters will be numeric.

# Input: String containing numeric characters
# Output: The corresponding Integer

# Examples:
# string_to_integer('4321') == 4321
# string_to_integer('570') == 570

# Data: String (input)
# Maybe an array? Array of each character so we can calulate numeric value of 
#   each digit (ascending)
# Maybe a hash to convert string to number?

# Algorithm:
# Given an input string of digits, number:
#   Convert the string to an array of individual digits, digits: []
#   Reverse the order of digits (1s, 10s, 100s, etc.)
#   Initialize a new variable, sum = 0
#   Iterate over digits. For each digit:
#     place_value is equal to 10 raised to the current digit's index
#     numeric value of digit is equal to HASH[digit] * place_value
#       add result to sum
#   Return sum

STRING_NUMBERS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, 
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_integer(str)
  chars_in_reverse = str.chars.reverse
  sum = 0
  chars_in_reverse.each_with_index do |char, index|
    place_value = 10 ** index
    digit = STRING_NUMBERS[char]
    number = digit * place_value
    sum += number
  end
  sum
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570
p string_to_integer('502') == 502

# Further Exploration: 
# Write a hexadecimal_to_integer method that converts a string (representing a 
# hexadecimal number) to its integer value.

# Input: A string representing a hexadecimal character.
# Output: The corresponding Integer
# Rules: 
#   Hexadecimal is a base 16 number
#   16 symbols: 0-9, A(10), B(11), C(12), D(13), E(14), F(15)
#   Converting hexadecimal to Integer:
#   Starting from the first digit on the right and going left:
#     Take the numeric value of the digit (eg. F-> 15) and multiply it by
#     the place value: base 16, so 16 to the power of 0 (first digit)
#   eg. F -> 15; 15 * 16**0 => 15
#       9 -> 9 ; 9 * 16** 1 => 144

# Example:
# hexadecimal_to_integer('4D9f') == 19871

# Data: Same data structure as string to int - convert string to array of chars
#   and reverse the order

# Algorithm:
# Given an input string representing a hexadecimal number, hexadecimal:
#   Convert the string to an array and reverse the order of the array - digits in reverse
#   Initialize sum = 0
#   Iterate through digits. For each digit:
#     Get the numeric value of the character from hash constant (upcase)
#     Multiply the numeric value by the place value: 16 ** current index
#     Add the result to sum
#   Return sum

HEXADECIMAL_NUMBERS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
  'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14, 
  'F' => 15
}

def hexadecimal_to_integer(hexadecimal)
  chars_in_reverse = hexadecimal.upcase.chars.reverse
  sum = 0
  chars_in_reverse.each_with_index do |char, index|
    place_value = 16 ** index
    digit = HEXADECIMAL_NUMBERS[char]
    number = digit * place_value
    sum += number
  end
  sum
end

p hexadecimal_to_integer('4D9f') == 19871
p hexadecimal_to_integer('1BD198') == 1823128
