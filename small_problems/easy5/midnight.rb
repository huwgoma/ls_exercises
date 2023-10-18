# After Midnight (Part 1)
# The time of day can be represented as the number of minutes before or after
# midnight. If number of minutes is positive, time is AFTER midnight; if number
# of minutes is negative, time is BEFORE midnight.

# Write a method that takes a time using this minute based format and 
# returns the time of day in 24 hour format (hh:mm).
#   Do not use Date or Time classes.

# Input: Integer (positive/negative/0), representing the number of minutes
#   before (negative) or after (positive) midnight.

# Output: A String representing the same time in 24-hour format.

# Rules: 
# -Do not use Date or Time classes; disregard Daylight Savings/Standard Time/etc.

# Examples:
# time_of_day(0) == "00:00"
# time_of_day(-3) == "23:57"
# time_of_day(35) == "00:35"
# time_of_day(-1437) == "00:03"
# time_of_day(3000) == "02:00"
# time_of_day(800) == "13:20"
# time_of_day(-4231) == "01:29"

# Data: 
#   Integer (given) - number of minutes before/after midnight
#   String (to be returned)
#   Maybe two integers representing hour and minute (hh:mm)
#   Number of minutes in a day -> 1440

# Algorithm:
# Given an Integer representing the number of minutes before/after midnight, minutes:
#   Negative:
#     Save the sign of minutes: -1 if negative, 1 otherwise
#     If sign is negative, minutes is equivalent to the number of minutes
#       in a day minus the given number of minutes
#       eg. -3 is equivalent to 1440-3 (1437) (=> 12:57)
#      So reassign minutes to minutes_in_day - minutes

#   Divide minutes into days first => days, remainder minutes
#     Divide remainder minutes into hours and minutes.
#       => hours, minutes
#   Convert hours and minutes to a string, pad with 0 (to 2 chars), then
#     return the string.    

MINUTES_IN_DAY = 1440
MINUTES_IN_HOUR = 60

def time_of_day(minutes)
  minutes = minutes % MINUTES_IN_DAY
  hours, minutes = minutes.divmod(MINUTES_IN_HOUR)
  "#{format('%02d', hours)}:#{format('%02d', minutes)}"
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"

# Further Exploration
# Using Ruby Date/Time classes

# Given an input integer representing the number of minutes before/after midnight:
# 