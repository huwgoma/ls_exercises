# Daily Double 
# Write a method that takes a String argument and returns a new String containing
# the original String's value, but with all consecutive duplicate characters
# collapsed into a single character.
#   - Do not use #squeeze or #squeeze!

# Input: A String 
# Output: A NEW String with all consecutive duplicate characters of the original 
#   String collapsed into one character.

# Examples:
# crunch('ddaaiillyy ddoouubbllee') == 'daily double'
# crunch('4444abcabccba') == '4abcabcba'
# crunch('ggggggggggggggg') == 'g'
# crunch('a') == 'a'
# crunch('') == ''

# Data: 
#   - The String given as input
#     Probably iterate through this 
#   - The String that will be output
#     Probably add to this string as we iterate through input string

# Algorithm:
# Given an input String, str:
#   Initialize a new empty string, result = ''
#   Iterate through each character of str. For each character:
#     Add the current character to result string, unless that character
#     is a consecutive duplicate.
#       - Add the current character to `result`, unless the last character 
#         in `result` (last char to be added) is identical to the current char
#   Return the result string after iteration

def crunch(str)
  result = ''
  str.each_char do |char|
    result << char unless result.end_with?(char)
  end
  result
end

# p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
# p crunch('4444abcabccba') == '4abcabcba'
# p crunch('ggggggggggggggg') == 'g'
# p crunch('a') == 'a'
# p crunch('') == ''

# Further Exploration
# def crunch(text)
#   index = 0
#   crunch_text = ''
#   while index <= text.length
#     crunch_text << text[index] unless text[index] == text[index + 1]
#     index += 1
#   end
#   crunch_text
# end

# What happens if we stop iterating when index == text.length?
# Index starts at 0, so the max index will always be less than the string
#   length by 1. If we stop iterating when index == text length, on the last
#   iteration, text[index] and text[index + 1] will both be out of bounds and
#   will both return nil. In this case, the code still runs (because nil == nil, 
#   so crunch_text << text[index] is not executed), but if crunch_text << nil 
#   were to be evaluated, it would raise an error as String#<< tries to convert
#   nil to a String.

# Why didn't we use #each_char or #chars to iterate through the String?
#   Using #each_char or #chars to iterate through the String would make the 
#   indexed retrievals redundant (as #each_char and #chars.each already 
#   naturally retrieve and expose each character to the block.)

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''
