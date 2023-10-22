# Lettercase Counter
# Write a method that takes a string and returns a hash with 3 key-value pairs:
# 1) Number of characters in the string that are lowercase,
# 2) Number of characters that are uppercase
# 3) Number of characters that are neither.

# Input: A String
# Output: A Hash w/ 3 entries:
#   lowercase: # of lowercase characters,
#   uppercase: # of uppercase characters,
#   neither: # of non-alphabetic characters

# Examples:
# letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
# letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
# letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
# letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

# Data: 
#   The String given as input - probably will need to iterate through its chars 
#   The Hash that we will build and return
# How to check if a character is uppercase/lowercase/neither?
#   Create some constants for lowercase letters and uppercase letters
#   Check each character for inclusion in those arrays?

# Algorithm:
# Given a String, str:
#  Initialize two constant arrays, UPPERCASE and LOWERCASE: A-Z and a-z
#  Initialize the hash to be returned, case_counter = {}. default value = 0
#   Iterate through str's characters. For each character:
#     Check if the current character is included in UPPERCASE 
#       if true, increment case counter [uppercase] by 1
#     Check if current character is included in LOWERCASE
#       ... case counter[lowercase] += 1
#     Otherwise, increment case counter[neither] by 1.
#   Return case counter hash.

UPPERCASE = Array('A'..'Z')
LOWERCASE = Array('a'..'z')

def letter_case_count(str)
  case_count = { lowercase: 0, uppercase: 0, neither: 0 }

  str.chars.each_with_object(case_count) do |char, hash|
    if UPPERCASE.include?(char)
      hash[:uppercase] += 1
    elsif LOWERCASE.include?(char)
      hash[:lowercase] += 1
    else
      hash[:neither] += 1
    end
  end
end

# Using #count
# Initialize the result hash
#   Set each key's value manually:
#   Uppercase: Take the count of characters in the String that are uppercase
#     Initialize a new counter, uppercase_counter = 0
#     Iterate over each character; for each character:
#       Check if the current character is uppercase (alphabetic). If it is, 
#       increment uppercase counter by 1
#   Lowercase: Take the count of characters that are lowercase
#   Neither: Take the count of characters that are non-alphabetic

def letter_case_count(str)
  case_count = { lowercase: 0, uppercase: 0, neither: 0 }

  case_count[:lowercase] = str.count('a-z')
  case_count[:uppercase] = str.count('A-Z')
  case_count[:neither] = str.count('^a-zA-Z')
  case_count
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }