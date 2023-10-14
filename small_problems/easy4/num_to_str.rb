# Number to String
# Write a method that takes a positive integer or 0 and returns the corresponding
# String. Do not use any of the built-in conversion methods.

# Input: An integer; assume it is positive or 0.
# Output: A String representation of the Integer.
# Rules: Do not use #to_s, String(), or #format (conversion methods)

# Examples:
# integer_to_string(4321) == '4321'
# integer_to_string(0) == '0'
# integer_to_string(5000) == '5000'

# Data: 
#   A Hash containing the integer->string conversions
#   An array of the digits in the Integer

# Algorithm (Without #digits)
# Initialize an empty string ''
# Divide the integer into its digits one at a time:
#   Divide integer by 10 and save the quotient + remainder
#   Convert the remainder to a string via the conversion hash and add it to 
#     str
#   Divide the quotient by 10 again (repeat until quotient is 0)
# Reverse the contents of str and return it


NUMBER_STRINGS = { 
  0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4',
  5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9'
}

# def integer_to_string(int)
#   str = ''
#   loop do
#     quotient, remainder = int.divmod(10)
#     str << NUMBER_STRINGS[remainder]
#     int = quotient
#     break if quotient == 0
#   end
#   str.reverse
# end

# Algorithm (with #digits)
# Initialize an empty string ''
# Divide the integer into its digits (using #digits); reverse the array
# Iterate over the digits array and retrieve the corresponding string value for 
#   each digit
#   Add that string value to str (mutate)
# Return str

def integer_to_string(int)
  str = ''
  digits = int.digits.reverse
  digits.each { |digit| str << NUMBER_STRINGS[digit] }
  str
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'