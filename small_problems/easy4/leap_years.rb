# Leap Years (Part 1)
# Input: An integer representing a year
# Output: A boolean: true if the year is a leap year, false otherwise
# - A leap year is defined as a year that is evenly divisible by 4
# - If the year is divisible by 100, it must also be divisible by 400 
#   to be considered a leap year
#   eg. 200 is not a leap year, but 400 is.

# Examples:
# leap_year?(2016) == true
# leap_year?(2015) == false
# leap_year?(2100) == false
# leap_year?(2400) == true
# leap_year?(240000) == true
# leap_year?(240001) == false
# leap_year?(2000) == true
# leap_year?(1900) == false
# leap_year?(1752) == true
# leap_year?(1700) == false
# leap_year?(1) == false
# leap_year?(100) == false
# leap_year?(400) == true

# Data: 
#   Probably none? Just the integer?

# Algorithm:
# Given an integer representing a year, `year`:
#   Conditional: 
#   If the year is not divisible by 4, return false.
#   If the year is divisible by 100, return false unless it is also divisible 
#     by 400. 
#   Return true

def leap_year?(year)
  return false unless divisible_by?(year, 4)
  return divisible_by?(year, 400) if divisible_by?(year, 100)
  true
end

def divisible_by?(dividend, divisor)
  (dividend % divisor).zero?
end

# def leap_year?(year)
#   if year % 100 == 0
#     false
#   elsif year % 400 == 0
#     true
#   else
#     year % 4 == 0
#   end
# end
# This implementation will fail on years that are divisible by 400 (should be
# leap year) - they will encounter year % 100 first (because all numbers that are
# divisible by 400 are also divisible by 100) and return false

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true