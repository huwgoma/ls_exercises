# Leap Years, Part 2
# Before 1752, leap years occurred in any year that was evenly divisible by 4.
# eg. Year 100 would be considered a leap year.

# Input: Integer representing the year.
# Output: Boolean representing whether the year is a leap year or not.
#   - If the year is less than or equal to 1752, year just needs to be divisible 
#     by 4.
#   - If year > 1752, year needs to be divisible by 4 and divisible by 400 
#     (if it is divisible by 100).

# Algorithm:
#   If the year is not divisible by 4, return false.
#   If the year is less than or equal to 1752, return true.
#   Otherwise, if the year is divisible by 100, return whether it is also 
#     divisible by 400. 
#   Return true (divisible by 4, not divisible by 100, and greater than 1752)

def leap_year?(year)
  return false unless divisible_by?(year, 4)
  return true if year <= 1752
  return divisible_by?(year, 400) if divisible_by?(year, 100)
  true
end

def divisible_by?(dividend, divisor)
  (dividend % divisor).zero?
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true