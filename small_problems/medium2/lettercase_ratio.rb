# Lettercase Percent Ratio
# Write a method that takes a string, then returns a hash containing 3 entries:
# lowercase: percentage of characters that are lowercase letters
# uppercase: % of characters that are uppercase
# neither: percentage of characters that are neither
# - Assume the string will always contain at least one character

# Input: A String containing some characters (at least one)
# Output: A Hash with 3 entries, where the key-value pairs describe the percentage
#   of lower/upper/neither case characters in the given string
#   - percentages are expressed as floats.

# Examples:
# letter_percentages('abCdef 123') 
#    == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
# There are 10 characters: 5 are lowercase, 1 is upper, and 4 are neither

# letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
# letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }

# Data:
#   The string given as input
#   - Probably will need to iterate over the characters and create a count of
#     upper/lower/neither case characters
#   To keep count: A Hash (the hash to be returned)

# Algorithm:
# Given a string as input, str:
# Initialize a new hash, cases = {} (default value 0)
# Iterate through each character of str. For each character:
#   If the character is lowercase, increment cases[lower] by 1
#   If character is uppercase, increment cases[upper] by 1
#   Otherwise, increment cases[neither] by 1
#   - Checking cases:
#   Use #ord values?
#   - A-Z is from 65-90; a-z is from 97-122
#   Or just check if the character is between a, z / A, Z
#   Or create an upper/lowercase array
# => Hash of case: case COUNT values
# Transform each value: 
#   For each value, divide the case COUNT value by the total # of characters in 
#     str. (Use float div)
#     -> Decimal, multiply by 100 to get percentage
#   - Set the value to the result of float div + 100 multiplication
#   eg. In a 10-char string, if there are 5 lowercase chars, 5/10 -> 0.5 * 100 ->
#       50.0

# def letter_percentages(str)
#   cases = { lowercase: 0, uppercase: 0, neither: 0 }
#   str.each_char do |char|
#     if char.between?('a', 'z')
#       cases[:lowercase] += 1
#     elsif char.between?('A', 'Z')
#       cases[:uppercase] += 1
#     else
#       cases[:neither] += 1
#     end
#   end
  
#   cases.transform_values! do |value|
#     value.fdiv(str.length) * 100
#   end
# end

# p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
# p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
# p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }


# Further Exploration:
# If you passed a string 'abcdefGHI', the returned hash would look like 
# { lowercase: 66.6666, upercase: 33.3333, neither: 0.0 }
# - Round the float numbers so they are always displayed to one decimal point.

def letter_percentages(str)
  cases = { lowercase: 0, uppercase: 0, neither: 0 }
  str.each_char do |char|
    if char.between?('a', 'z')
      cases[:lowercase] += 1
    elsif char.between?('A', 'Z')
      cases[:uppercase] += 1
    else
      cases[:neither] += 1
    end
  end
  
  cases.transform_values do |value|
    (value.fdiv(str.length) * 100).round(1)
  end
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
p letter_percentages('abcdefGHI')