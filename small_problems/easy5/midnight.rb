# After Midnight, Part 1
# The time of the day can be represented as the number of minutes before or after 
# midnight. If the number of minutes is positive, it represents the number of 
# minutes AFTER midnight; if the number of minutes is negative, it represents the
# number of minutes BEFORE midnight.

# Write a method that takes an integer representing the number of minutes before
# or after midnight, and returns the time of day in 24 hour format (hh:mm)
# - Do not use Date or Time classes

# Input:
#   An integer representing the number of minutes before (negative) or 
#   after (positive) midnight.
# Output: 
#   A String representing the time of day, in 24 hour format (0-23, 0-59) hh:mm

# Examples:
# time_of_day(0) == "00:00"
# time_of_day(-3) == "23:57"
# time_of_day(35) == "00:35"
# time_of_day(-1437) == "00:03"
# time_of_day(3000) == "02:00"
# time_of_day(800) == "13:20"
# time_of_day(-4231) == "01:29"

# Data:
# The integer given as input - represents # of minutes before/after midnight.
# - Divide the number of minutes into hours and minutes
# - Also make sure we simplify the given number of minutes to a number less than
#   or equal to the number of minutes in a single day (1440).
# - If the number of minutes is negative, we can reach the same time by going 
#   forward by 1440 - number of minutes instead.
#   eg. 5 minutes before midnight is the same time as 23 hours and 55 minutes after
#       midnight. 


# Algorithm:
# Given an integer representing the # of minutes before/after midnight as input:


# Simplify the number of minutes to a single day:
# - There are 1440 minutes in a day.
# - Divide number of minutes (absolute) by 1440 
#   => Number of days; remainder is the number of minutes before/after midnight.
# If the given integer was negative, convert it to a positive:
# - Subtract the absolute value of the midnight-relative minutes (from step 1) from
#   1440 (the number of minutes in a day)
# Divide the remaining number of minutes into hours and minutes.
# - Divide number of minutes by 60 
#   => Number of hours; remainder is the minutes portion of the time.

# -4231 - Convert to minutes after midnight:
# 4231.divmod(1440) => [2, 1351]
# midnight_minutes is negative? yes.
# - Convert to positive: 1440 - 1351 => 89
# hours, minutes = 89.divmod(60) => [1, 29]

MINUTES_IN_DAY = 1440
MINUTES_IN_HOUR = 60

def time_of_day(total_minutes)
  midnight_minutes = total_minutes.abs % MINUTES_IN_DAY
  midnight_minutes = MINUTES_IN_DAY - midnight_minutes if total_minutes.negative?
  hours, minutes = midnight_minutes.divmod(MINUTES_IN_HOUR)
  format('%02d:%02d', hours, minutes)
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"


