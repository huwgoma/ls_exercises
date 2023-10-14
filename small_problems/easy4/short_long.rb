# Write a method that takes two strings as arguments, 
# determines the longest of the two strings, and then 
# returns the result of concatenating the shorter string, 
# the longer string, and the shorter string once again. 
# You may assume that the strings are of different lengths.

# Input: Two String arguments.
#   - Am I allowed to assume that the arguments will be String?
# Output: String.
#   - shorter String + longer String + shorter String 
#   - Am I allowed to mutate the arguments? -> No -> Return a new String.

# Examples:
#   short_long_short('abc', 'defgh') == "abcdefghabc"
#   short_long_short('abcde', 'fgh') == "fghabcdefgh"
#   short_long_short(' ', 'xyz') == " xyz "

# Data: 
#   Strings

# Algorithm:
#   Given two String arguments, str1 & str2:
#   Check the length of each string and determine which one is shorter.
#   If str1 is shorter: 
#     Create a new string containing str1 + str2 + str1
#   If str2 is shorter:
#     Create a new string containing str2 + str1 + str2 
#   Return the new string.

# Refactor: 
#   Given two String arguments, str1 and str2: 
#   Initialize and assign two variables to the shortest and longest strings:
#     Collect all strings in an array
#     Return the shortest and longest strings in an array 
#     Save to short/long variables


# def short_long_short(str1, str2)
#   if str1.length < str2.length
#     str1 + str2 + str1
#   elsif str2.length < str1.length
#     str2 + str1 + str2
#   end
# end

def short_long_short(str1, str2)
  short, long = [str1, str2].minmax_by(&:length)
  short + long + short
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"