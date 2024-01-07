# Next Featured Number, Higher than Given Value
# A 'featured number' (arbitrary to this exercise) is an odd number that is 
#   a multiple of 7, and whose digits only occur once each (ie. are unique)

# Write a method that takes a single integer as an argument, and returns the 
#   next-largest featured number 
# - If no such number is possible, return an error message.

# Input: An Integer
# Output: The integer that is the next-largest featured number (relative to
#   the given integer)

# Examples:
#   49: featured (odd; divisible by 7; 4 and 9 only occur once each)
#   98: not featured (not odd)
#   97: not featured(odd; but not divisible by 7)
#   133: not featured(odd; divisible by 7; but 3 occurs twice)

# featured(12) == 21
# featured(20) == 21
# featured(21) == 35
# featured(997) == 1029
# featured(1029) == 1043
# featured(999_999) == 1_023_547
# featured(999_999_987) == 1_023_456_987

# featured(9_999_999_999) 
# # -> There is no possible number that fulfills those requirements


# Data:
# - The Integer given as input (starting point)
# - The 'featured number' integer (ending point)
# * If there is none ?

# Algorithm:
# Given an integer as input, starting_int:
# Find the next-closest multiple of 7 (save to a variable, number)
#   Divide starting_int by 7, subtract the remainder from 7, add the result to
#     starting_int.
#     eg. starting_int = 12; 12 % 7 -> 5; 7-5 -> 2; 12 + 2 => 14
# Check if `number` is a 'featured number':
#   Given an integer, int:
#     int is 'featured' if it is odd, AND it is divisible by 7, AND all digits 
#       only occur once.
#     Unique digits:
#     - Get an array of the integer's digits.
#     - Remove all duplicate values
#     - Compare the unique digits to the original integer digits
# If it is, return `number`
# If it is not, increment number by 7 and repeat loop
# - break condition?


def featured(int)
  number = next_multiple(int, 7)

  while number >= 9_876_543_210
    return number if featured?(number)
    number += 7
  end
  'No possible featured number'
end

def next_multiple(int, multiple_of)
  int + (multiple_of - (int % multiple_of))
end

def featured?(int)
  int.odd? && (int % 7 == 0) && digits_unique?(int)
end

def digits_unique?(int)
  digits = int.digits
  digits.uniq == digits
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987


# Break Condition: What is the highest-possible featured value?
#   There are only 10 digits: 0123456789.
#     Therefore, the largest possible unique number is 9 876 543 210
#     
p featured(9_999_999_999) 
# -> There is no possible number that fulfills those requirements