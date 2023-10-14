# Signed Number to String
# Write a method that takes an integer, and returns the string representation
# Add the ability to represent the sign of the number as well.

# Input: Integer still (optional negative sign)
# Output: String, representing the integer and its sign
#   - No sign for 0

# Examples:
# signed_integer_to_string(4321) == '+4321'
# signed_integer_to_string(-123) == '-123'
# signed_integer_to_string(0) == '0'

# Data: 
# String to be returned
# Array of the digits in the number
#   Cannot use #digits on a negative number; need to deal with the sign first

# Algorithm:
# Given an Integer input, int:
# Determine the sign of the number:
#   If the integer is negative, set sign to '-'
#   If the integer is zero, set sign to ''
#   Otherwise (positive), set sign to '+'
# Convert the number to a string using #integer_to_string method
#   - Pass in the absolute value of the integer (avoid negative domain error)
#   Returns string
# Prepend sign to string
# Return string

NUMBER_STRINGS = { 
  0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4',
  5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9'
}

def integer_to_string(int)
  str = ''
  digits = int.digits.reverse
  digits.each { |digit| str << NUMBER_STRINGS[digit] }
  str
end

def signed_integer_to_string(int)
  sign = if int.negative?
          '-'
         elsif int.zero?
          ''
         else
          '+'
         end
  integer_to_string(int.abs).prepend(sign)
end

# Refactor LS Solution
def signed_integer_to_string(number)
  sign = case number <=> 0
         when -1 then '-'
         when +1 then '+'
         else         ''
         end
  integer_to_string(number.abs).prepend(sign)
end



p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'