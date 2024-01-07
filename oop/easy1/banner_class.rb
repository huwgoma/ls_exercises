# Given this incomplete class for constructing boxed banners:
# class Banner
#   def initialize(message)
#   end

#   def to_s
#     [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
#   end

#   private

#   def horizontal_rule
#   end

#   def empty_line
#   end

#   def message_line
#     "| #{@message} |"
#   end
# end

# Complete the class so that the test cases pass. 
# You may add any needed methods/instance variables; however, do not make the 
#   implementation details public.
# - Assume that the input will always fit in the terminal window.


# PEDAC:
# Input: A String representing the message 
# Output: A String displaying the message surrounding by a boxed banner

# Examples:
# banner = Banner.new('To boldly go where no one has gone before.')
# puts banner
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

# banner = Banner.new('')
# puts banner
# +--+
# |  |
# |  |
# |  |
# +--+

# Data:
# The message String (given at instantiation)
# - Calculate the number of characters in the message (to determine width)
# Some lines:
#   - Horizontal Rule (Top/Bottom): +------...---+
#     => +-#{# of chars in message * -}-*
#   - Empty Line:
#     => | #{# of chars * space} |
#   - Message Line (Given)
#     => | #{message} |
#   Join the lines together (horizontal - empty - message - empty - horizontal)
#     in the to_s method

# Algorithm:
# Given a String as input, @message = message:
# Calculate the length of @message (@length)
# Construct 3 strings (horizontal, empty, message)
#   Horizontal: "+-#{length * '-'}-+"
#   Empty:      "| #{length * ' '} |"
#   Message:    "| #{message} |"
# Create an array of string objects [horizontal, empty, message, empty, horizontal]
# Join the array of strings together using a newline separator.

# class Banner
#   def initialize(message)
#     @message, @size = message, message.size
#   end

#   def to_s
#     [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
#   end

#   private

#   attr_reader :message, :length

#   def horizontal_rule
#     "+-#{'-' * size}-+"
#   end

#   def empty_line
#     "| #{' ' * size} |"
#   end

#   def message_line
#     "| #{@message} |"
#   end
# end

# banner = Banner.new('To boldly go where no one has gone before.')
# puts banner

# banner = Banner.new('')
# puts banner

# Further Exploration: Modify this class so ::new will -optionally- allow you to
#   specify a fixed banner width at instantiation. 
#   - The message should be centered within the banner of that width.
#   - How to handle widths that are too narrow or too wide?
# Too Narrow (ie. the banner width is less than the message size + 2 R/L).
#   Overflow the excessive message characters to the next line
# +---+
# | a |
# | b |
# +---+
#   Or truncate with ..
# +------+
# | ab.. |
# +------+

# Too Wide (ie. the banner width is greater than the message size + 2 R/L).
#   Maintain banner width, center the message (and horizontal+empty) to a fixed
#   width (banner width) -> Increase padding on each side
# +-----+
# | ab  |
# +-----+

# Algorithm:
# Modify initialize: Add an additional optional parameter.
#   fixed_width: nil (represents a fixed width of the ENTIRE banner)
#   - Set @inner_width to fixed_width - 4, or to message size.
# Create the 3 line types:
#   Horizontal: +- , '-'' * innerwidth, -+
#   Empty:      | , ' ' * innerwidth, |
#   Message: Check if message size is greater than inner width. 
#     Greater (Inner width is too narrow): Split into an array of strings that are
#       inner_width - 4 length long
#       - Iterate through each substring and build the message string:
#       | #{substring} | + \n (concat to message)
#       - Chop/chomp the final \n character off
#     Less (Inner width is greater than message size)
#     - Can do same thing as greater?
#     - If message is less than the inner width cutoff, we will just have an array
#       of one substring 
#       eg. inner width = 10, message = 'abc' => ['abc']
#     - Center the message within the line to inner width with spaces
# to_s as normal

class Banner
  def initialize(message, width: nil)
    @message = message
    @inner_width = (width&.- 4) || message.size
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end


  attr_reader :message, :inner_width

  private


  def horizontal_rule
    "+-#{'-' * inner_width}-+"
  end

  def empty_line
    "| #{' ' * inner_width} |"
  end

  def message_line
    message_lines = message.chars.each_slice(inner_width).map(&:join)
    
    message_lines.each_with_object('') do |line, message|
      message << "| #{line.center(inner_width, ' ')} |\n"
    end.chomp
  end
end

narrow_banner = Banner.new('To boldly go where no one has gone before', width: 10)
puts narrow_banner

wide_banner = Banner.new('I am a cat', width: 20) # 10 chars
puts wide_banner