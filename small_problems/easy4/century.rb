# Century
# Input: An integer representing a year (eg. '2000')
# Output: A new string containing the century of given year, suffixed with
#   st, nd, rd, or th (as appropriate)
#   - 1 century = 100 years
#   - A new century starts on years that end with 01.
#   eg. 1901-2000 is the 20th century; 2001 is the 21st century.

# Examples:
# century(2000) == '20th'
# century(2001) == '21st'
# century(1965) == '20th'
# century(256) == '3rd'
# century(5) == '1st'
# century(10103) == '102nd'
# century(1052) == '11th'
# century(1127) == '12th'
# century(11201) == '113th'
# 0 case? -> 0th?

# Data: 
# 1st 2nd 3rd 4th 5th 6th 7th 8th 9th 10th
# 11th 12th 13th 14th 15th 16th 17th 18th 19th 20th
# 21st 22nd 23rd 24th 25th 26th..
# 
# 'th' applies if the number ends with 11, 12, 13, or 4/5/6/7/8/9/0
# 'st' applies if the number ends with 1 (not 11)
# 'nd' applies if the number ends with 2 (not 12)
# 'rd' applies if the number ends with 3 (not 13)

# Algorithm:
# Given an integer representing a year, year:
# Divide the year by 100 (float division) and round up -> century
# convert century to a string and check what it ends with
# if century ends with 11, 12, 13, 4, 5, 6, 7, 8, 9, or 0, append 'th' 
# otherwise if century ends with 1, append 'st'
# '' 2 => 'nd'
# '' 3 => 'rd'

def century(year)
  century = (year/100.0).ceil.to_s
  th_cases = ['11', '12', '13', '4', '5', '6', '7', '8', '9', '0']
  suffix = if century.end_with?(*th_cases)
             'th'
           elsif century.end_with?('1')
             'st'
           elsif century.end_with?('2')
             'nd'
           elsif century.end_with?('3')
             'rd'
           end
  century << suffix
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'