# Unlucky Days
# Write a method that returns the number of Friday the 13ths in the year
#   specified by the given argument.
# - Assume the year will be greater than 1752 (switch to Gregorian calendar)

# Input: An integer (>1752) representing a year
# Output: A new integer representing the number of Friday the 13ths that are 
#   within that year.
# Rules:
# - Friday the 13ths: All Fridays that have a date value of 13

# Examples:
# friday_13th(2015) == 3
# friday_13th(1986) == 1
# friday_13th(2019) == 2

# Data:
# - The integer given as input representing the year
# - Might need to create an array of Date objects
#   - All Dates that have a day value of 13 
#     -> Filter by all dates that have a weekday value of friday

# Algorithm:
# Given an integer as input, year:
# Create an array of Date objects: 
#   - Iterate from 1-12. For each month:
#     - Create a Date object with the given `year`, the current month, and
#       day = 13.
# Filter the 13ths to only include the dates that are fridays
# Return the size of the filtered 13ths array

require 'date'

def friday_13th(year)
  thirteenths = (1..12).map do |month|
    Date.new(year, month, 13)
  end
  
  thirteenths.select { |date| date.friday? }.size
end

# p friday_13th(2015) == 3
# p friday_13th(1986) == 1
# p friday_13th(2019) == 2


# Further Exploration: 
# Count the number of months that have five Fridays.

# Input: An integer representing a year
# Output: A new integer representing the number of months in that year
#   that contain 5 fridays.

# Examples:
# five_fridays(2023) == 4
# five_fridays(2024) == 4

# Data: 
# - Maybe a hash?
# Keys are the months, values are an array of all fridays in that month
# eg. { 11: [November 3, November 10, November 17, November 24] }
# or nested array [ [Jan 1, Jan 8, ...], [Feb 2, Feb 9, ...] ]

# Algorithm:
# Given an integer as input, year:
# Create a hash containing all Fridays in the given year, organized by 
#   months (keys).

# Map from 1-12. For each month:
#   Create an array of all the fridays in that month (fridays_in_month)

#   #fridays_in_month - Given a month and a year, return an array of all fridays 
#   in that month.
#   - Create a new array, fridays = []
#   - Create a new date object, starting from the 1st day of the given month and year
#     - If date is a friday, add it to fridays, then increment date by 7 days
#     - If date is not friday, increment date by 1 day
#     - Loop while the date's month is equal to the given month
#       ie. Stop when date is no longer in the same month 

# => Nested array where each subarray contains the fridays in that month
#     eg. [ [January 3, January 10, ...], [Feb 2, Feb 9, ...] ]
#   
# Iterate through fridays and count the number of friday subarrays containing 
#   5 dates (ie. 5 fridays)

require 'date'

def five_fridays(year)
  yearly_fridays = (1..12).map do |month|
    fridays_in_month(year, month)
  end

  yearly_fridays.count { |fridays| fridays.size == 5 }
end

def fridays_in_month(year, month)
  fridays = []
  date = Date.new(year, month)

  while date.month == month
    if date.friday?
      fridays << date
      date = date.next_day(7)
    else
      date = date.next
    end
  end
  fridays
end

p five_fridays(2023) == 4
p five_fridays(2024) == 4