# Cute Angles
# Write a method that takes a floating point number (decimal) representing an
#   angle between 0-360 degrees, and returns a String representing that angle
#   in degrees, minutes, and seconds.
#   - Degree: ° ; Minutes: ' ; Seconds: "
#   - 1 Degree -> 60 minutes; 1 minute -> 60 seconds

# Input: 
#   A Float number (0.0-360.0)
# Output: 
#   A String representing that angle (degrees minutes seconds)
#   - Use 2 digit numbers (leading 0) for minute/second formatting

# Examples:
# dms(30) == %(30°00'00")
# dms(76.73) == %(76°43'48")
# dms(254.6) == %(254°36'00")
# dms(93.034773) == %(93°02'05")
# dms(0) == %(0°00'00")
# dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

# Data: 
#   Float number (input)
#   Decimal -> Degree Conversion Rules: 
#     Degree -> 1:1 with the whole number part of the given float
#     Minute -> Decimal * 60 -> Whole number 
#     Second -> Decimal (of above) * 60

# Algorithm: 
# Given an input Float number, float:
#   Extract the degree, minute, and second values:
#     Degree: Round the float DOWN to an Integer
#     Minute: Subtract the degree from the float and multiply the 
#       resulting decimal by 60, then floor that result
#       eg. 93.034773: subtract degree (93) -> 0.034773
#           Multiply 0.034773 by 60 -> 2.08638 (save this value)
#           Floor the result -> 2
#     Second: Subtract the minute from decimal * 60 (above); multiply the 
#       resulting decimal by 60. (round to 2 digits)
#   Format each component to String form: 
#     Degree: Convert degree to a string and append the degree symbol °
#     Minute: Convert minute to a string, pad with 0 to 2 digits, then append '
#     Second: Convert second to a String, pad with 0 to 2 digits, append "
#   Final formatting of the string %(degree minute second) and return the string.


DEGREE = "°"

def dms(number)
  number = number % 360
  degree, decimal = number.divmod(1)
  minute, second = (decimal * 60).divmod(1)
  second = (second * 60).round

  format(%(#{degree}#{DEGREE}%02d'%02d"), minute, second)
end


p dms(30) #== %(30°00'00")
p dms(76.73) #== %(76°43'48")
p dms(254.6) #== %(254°36'00")
p dms(93.034773) #== %(93°02'05")
p dms(0) #== %(0°00'00")
p dms(360) #== %(360°00'00") || dms(360) == %(0°00'00")

# Further Exploration: 
#   The current solution returns an out-of-bounds output for inputs that are
#   out of bounds (less than 0 or greater than 360.)
#   eg. 400 => 400 deg 00 00
#       -40 => -40 deg 00 00
#      -420 => -420 deg 00 00

# Modify the code so that it always returns a value within 0-360.
# eg.
p dms(400) #== %(40°00'00")
p dms(-40) #== %(320°00'00")
p dms(-420) #== %(300°00'00")

# Algorithm:
# If the input is greater than 360, 
#   divmod the input by 360 and set the remainder as the starting number
# If the input is less than 0, 
#   divmod the input by 360 and set the remainder as the starting num


