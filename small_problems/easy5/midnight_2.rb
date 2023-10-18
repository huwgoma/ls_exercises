# After Midnight (Part 2)
# Write two methods that take a time of day (24h format, String),
# and return the number of minutes before and after midnight (Respectively)
# Both methods should return a value between 0 and 1439.

# Do not use Date or Time classes

# Input: String representing the time of day in 24 hour format
# Output: An integer representing the number of minutes before/after midnight
#   corresponding to the given time.
# Rules: 
#   Do not use Date/Time classes

# Examples:
# after_midnight('00:00') == 0
# before_midnight('00:00') == 0
# after_midnight('12:34') == 754
# before_midnight('12:34') == 686
# after_midnight('24:00') == 0
# before_midnight('24:00') == 0

# Data: 
#   String (as input)
#   Split the string into hours and minutes

# Algorithm:
# Given a string representing the time in 24-h format, time:
#   Extract the hour and minutes from the string
#     Split the string on ':' 
#     Convert each substring to an integer
#     Assign the two resulting integers to variables hours, minutes
#   Convert hours and minutes to just minutes
#     AFTER: Multiply hours by 60 and add to minutes. 
#     BEFORE: Multiply hours by 60, add to minutes, then subtract from 1440

# Midnight case: When time given is 00:00 or 24:00, minutes from midnight should
# be 0.
#   BEFORE midnight, 00:00 -> Currently returns 1440
#   AFTER midnight, 24:00 -> Currently returns 1440 
#   Convert hours + minutes to midnight minutes. 
#   Return midnight minutes if its value is between 0 and 1439; otherwise,
#     return 0

# before midnight 0 => 1440 - 0 => 1440
# after midnight 24 => 1440
# if total minutes is greater than 1439, overflow it to 0

# MINUTES_PER_HOUR = 60
# MINUTES_PER_DAY = 1440

# def after_midnight(time)
#   hours, minutes = time.split(':').map(&:to_i)
#   midnight_minutes = hours * MINUTES_PER_HOUR + minutes
#   overflow_time(midnight_minutes)
# end

# def before_midnight(time)
#   hours, minutes = time.split(':').map(&:to_i)
#   midnight_minutes = MINUTES_PER_DAY - (hours * MINUTES_PER_HOUR + minutes)
#   overflow_time(midnight_minutes)
# end

# def overflow_time(minutes)
#   minutes.between?(0, MINUTES_PER_DAY - 1) ? minutes : 0
# end

# p after_midnight('00:00') == 0
# p before_midnight('00:00') == 0
 
# p after_midnight('00:01') == 1
# p before_midnight('00:01') == 1439
 
# p after_midnight('12:34') == 754
# p before_midnight('12:34') == 686

# p after_midnight('24:00') == 0
# p before_midnight('24:00') == 0

# Further Exploration: Using Date / Time Classes
# Algorithm: 
# Given an input string representing the time in 24 hour format, time:
#   Extract the hour and the minute from the `time` string:
#     time = Time.parse; hour = time.hour; minute = time.min
#   Calculate the delta minutes (minutes from midnight) using the hour and min:
#     hour * 60 + min (After)
#     

require 'time'

MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = 1440

def after_midnight(time)
  time = Time.parse(time)
  hour = time.hour
  minute = time.min
  hour * MINUTES_PER_HOUR + minute
end

def before_midnight(time)
  delta = MINUTES_PER_DAY - (after_midnight(time))
  delta = 0 if delta == MINUTES_PER_DAY
  delta
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
 
p after_midnight('00:01') == 1
p before_midnight('00:01') == 1439
 
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686

p after_midnight('24:00') == 0
p before_midnight('24:00') == 0
