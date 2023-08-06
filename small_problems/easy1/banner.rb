# Bannerizer
# Input: String 
# Output: Print the string, surrounded by a box

# eg. print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

# print_in_box('')
# +--+
# |  |
# |  |
# |  |
# +--+

# Assume the input will always fit in the terminal window.

# Alg:
#   Calculate the width of the box (string length + 4)
#   Define top/bottom lines:
#     '-' * string length + 2 => center (box width, +) 
#   Define padding lines:
#     ' ' * string length + 2 => center (box width, |)
#   Define string line:
#     string, append (| ), concat ( |)

#   Print top line
#   Print padding line
#   Print string line
#   Print padding line
#   Print bottom line

# def print_in_box(str)
#   str_length = str.length
#   line_width = str.length + 4

#   border_line = ('-' * (str_length + 2)).center(line_width, '+')
#   padding_line = (' ' * (str_length + 2)).center(line_width, '|')
#   string_line = "| #{str} |"

#   puts border_line
#   puts padding_line
#   puts string_line
#   puts padding_line
#   puts border_line
# end



# Further Exploration
# Wrap long messages (80+ chars) to appear on multiple lines, within the box.
# Alg:
#   Split the string into 80-character sized chunks => strings array
#     Input: String, integer (substring length, 80)
#     Output: An array containing substr_length strings
#     Alg: 
#       Duplicate the string to avoid mutating the original.
#       Initialize a new empty array, substrings []
#       Until the duped string is empty:
#         Slice (substring_length) characters (destructively), starting from the front, and
#           add the slice to substrings array
#       Return substrings array

#   Print border line + padding line 
#   Iterate through strings. For each string:
#     Left justify the string with spaces to 76 (terminal width - 4)
#     Print the string, appended/prepended with '| ' / ' |' ( + 4).
#   Print border line + padding line

TERMINAL_WIDTH = 80

def split_string(str, substr_length)
  str = str.dup
  substrings = []
  substrings << str.slice!(0, substr_length) until str.empty?
  substrings
end

def print_in_box(str)
  line_width = [TERMINAL_WIDTH, str.length + 4].min
  border_line = ('-' * (line_width - 2)).center(line_width, '+')
  pad_line = (' ' * (line_width - 2)).center(line_width, '|')
  substrings = split_string(str, TERMINAL_WIDTH - 4)

  puts border_line
  puts pad_line
  substrings.each do |substr|
    puts "| #{substr.ljust(line_width - 4, ' ')} |"
  end
  puts pad_line
  puts border_line
end

#print_in_box('To boldly go where no one has gone before.')
# print_in_box('')
long_string = 'To boldly go where no one has gone before. To boldly go where no one has gone before. To boldly go where no one has gone before.'
print_in_box(long_string)