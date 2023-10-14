# String to Signed Number
# Extend the previous string_to_int method to work with signed numbers
# Write a method that takes a String of digits and returns the corresponding
# integer. The String may have a leading + or - sign.
#   If the first character is a -, return a negative number
#   Otherwise (+ or none), return a positive number
#   Assume the string will alwyas contain a valid number.
#   Do not use any conversion methods in Ruby, but you may use the previous
#   string_to_int method.

# Input: A String representing a number
# - The string may (or may not) have a sign (+/-) 
# Output: A number representing the given string
# - If the input string had a negative sign, return a negative number,
#   otherwise, return a positive number.

# Examples:
# string_to_signed_integer('4321') == 4321
# string_to_signed_integer('-570') == -570
# string_to_signed_integer('+100') == 100

# Data: 
#   Array of the characters in the string (reverse order)

# Algorithm: 
# Given an input string representing a number, str:
#   First check for the sign if given.
#     If the string starts with + or -, remove the first character 
#     and save it sign = + / -
#   If sign is '-', set sign_multiplier to -1; otherwise, 1.
#   Determine the numeric value of the string (except sign)
#   Multiply the numeric value by sign multiplier
#   Return number

 

STRING_NUMBERS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, 
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_integer(str)
  sum = 0
  reversed_chars = str.chars.reverse
  
  reversed_chars.each_with_index do |char, index|
    place_value = 10 ** index
    digit = STRING_NUMBERS[char]
    number = digit * place_value
    sum += number
  end
  sum
end

def string_to_signed_integer(str)
  sign = str.slice!(0) if str.start_with?('+', '-')
  sign_multiplier = sign == '-' ? -1 : 1
  string_to_integer(str) * sign_multiplier
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100