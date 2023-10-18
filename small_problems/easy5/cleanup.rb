# Clean up words
# Given a String that consists of some words (all lowercase), and some 
#   non-alphabetic characters, write a method that returns that string with
#   all non-alphabetic characters replaced by spaces. 
# If non-alphabetic characters appear consecutively, the returned String should 
#   only have one space (ie. do not have consecutive spaces)

# Input: A String containing words and non-words
# Output: The SAME String with only words and spaces
#   - Keep the words as-is 
#   - Replace non-alphabetic characters with spaces
#   - Do not have consecutive spaces

# Example:
# cleanup("---what's my +*& line?") == ' what s my line '

# Data: 
#   The String given as input
#   An Array of alphabetic characters to match against
#     eg. [a..z]

# Algorithm:
# Given an input String of words and characters, str:
# Define an array of alphabetic characters. 
#   Initialize a loop, counter = 0. For each iteration:
#   Retrieve the current character (eg. '-'). 
#   If the current character is non-alphabetic,
#     slice from string until an alphabetic character is encountered
#       eg. "---what's my +*& line?"
#       str[0] => '-' ; slice 0, 3 => '---'
#     replace the slice with a single space ' '
#       eg. " what's my +*& line?"
#     increment counter by 1.
#   return str

ALPHABET = Array('a'..'z')

def cleanup(str)
  counter = 0
  loop do
    char = str[counter]
    unless ALPHABET.include?(char)
      slice_end = determine_slice_end(str, counter)
      str[counter..slice_end] = ' '
    end
    counter += 1
    break if counter >= str.size
  end
  str
end

# Determine Slice Length 
# Given an input String and a starting index, return an Integer representing
#   the end of the slice to take
#   The slice should start from the starting index and span all consecutive
#     non-alphabetic characters (from that starting index)
# eg. "---what's my +*& line?", index = 0
#     => 2 (0..2) '---'
# eg. "---what's my +*& line?", index = 7
#     => 7 (7..7) "'"
# eg. "---what's my +*& line?", index = 21
#     => 21 (21..21) "'"

# Algorithm:
# Given a String, str, and an index, index:
# Loop until the current character is alphabetic OR nil; return index - 1
# Initialize a loop.
#   Retrieve the character at the current index. If character is alphabetic
#   or nil, end loop.
#   If character is not alphabetic, keep going. Increment index by 1.
# Return index - 1

def determine_slice_end(str, index)
  loop do
    char = str[index]
    return index - 1 if ALPHABET.include?(char) || char.nil?
    index += 1
  end
end


# With #squeeze:

# def cleanup(str)
#   chars = str.chars.map do |char|
#     ALPHABET.include?(char) ? char : ' '
#   end
#   chars.join.squeeze(' ')
# end

p cleanup("---what'ss my +*& line?") == ' what ss my line '