# Matching Parentheses?
# Write a method that takes a string and returns a boolean:
# - True if all parentheses in the string are balanced
# - False otherwise
# - ie. Every '(' must have a matching ')'

# Input: A String
# Output: A Boolean
# - True if all brackets are balanced 
# ie. If every '(' has a matching ')'
# - Balanced pairs must start with (, not )

# Examples:
# balanced?('What (is) this?') == true
# balanced?('What is) this?') == false
# balanced?('What (is this?') == false
# balanced?('((What) (is this))?') == true
# balanced?('((What)) (is this))?') == false
# balanced?('Hey!') == true
# balanced?(')Hey!(') == false
# balanced?('What ((is))) up(') == false

# balanced?('What ())(is() up') == false
# - cant just count '(' and ')'
# ())( => false

# Data: The string given as input
# - Probably need to iterate over each character

# Algorithm:
# Given a string as input, str:
# Iterate through each character of str. For each character:
#   If the current character is a opening bracket '(', increment 
#     bracket_count by 1.
#   If the current character is a closing bracket ')', decrement bracket_count
#     by 1. 
#     - If bracket_count is negative, return false
# - At the end of iteration, if bracket count is exactly 0, return true, otherwise
#   false

# def balanced?(str)
#   bracket_count = 0

#   str.each_char do |char|
#     next unless ['(', ')'].include?(char)

#     bracket_count += 1 if char == '('
#     bracket_count -= 1 if char == ')'
#     return false if bracket_count.negative?
#   end
#   bracket_count == 0
# end

# p balanced?('What (is) this?') == true
# p balanced?('What is) this?') == false
# p balanced?('What (is this?') == false
# p balanced?('((What) (is this))?') == true
# p balanced?('((What)) (is this))?') == false
# p balanced?('Hey!') == true
# p balanced?(')Hey!(') == false
# p balanced?('What ((is))) up(') == false
# p balanced?('What ())(is() up') == false

# Further Exploration:
# Expand this method to take into account square brackets [], curly brackets {}
# single quotes '', and double quotes ""

# Data:
# Instead of a single variable bracket count = 0
# - Maybe a hash to store each type of matching character
# pair_characters = { parentheses: { char: '()', count: 0 },
#   square_bracket: { char: '[]', count: 0 }
#   curly_bracket: 0, ... }

# Algorithm:
# Given a string as input, str:
# Create a hash to track the counts of each type of punctuation:
#   paired_chars = { '()' => 0, '[]' => 0, "''" => 0, ... }
# Create a string containing all the paired char types
#   eg. paired_chars_string = " ()[]''\"\" "
# Iterate through each character of str. For each char:
#   If the current character is not part of pair_chars_string, go next.

#   Otherwise:
#   Calculate the full punctuation (eg. calculate the other half)
#   => The full punctuation '()' acts as the key to the running total of that 
#       character type in paired_chars
#     - Select the key from `paired_chars` that includes the current character
#   Determine whether the current character is an opening or closing character
#     For the bracket types:
#     - If character is equal to full punctuation's first character -> opening
#     - If char is equal to full punctuation's second character -> closing
#     For quote types (2 of the same):
#     - If the count of that char type is already greater than 0 -> closing
#     - If count of that char type is 0 -> opening
#   Increment the count for that char type by 1 if that character is an opening char
#   Decrement by 1 if it's a closing character.
#   Return false if the count for current character has gone negative.
# End iteration
# Check that all counts for all char types are 0. True if all 0, false otherwise.



def balanced?(str)
  char_totals = { '()' => 0, '[]' => 0, '{}' => 0, "''" => 0, '""' => 0 }
  paired_chars = char_totals.keys.join

  str.each_char do |char|
    next unless paired_chars.include?(char)

    full_char = match_char_type(char, char_totals.keys)
    
    if opening_char?(char, full_char, char_totals[full_char])
      char_totals[full_char] += 1
    else
      char_totals[full_char] -= 1
      break if char_totals[full_char].negative?
    end
  end
  char_totals.values.all?(&:zero?)
end

def match_char_type(char, char_types)
  char_types.select do |type|
    type.include?(char)
  end.first
end

def opening_char?(char, full_char, char_count)
  case full_char
  when '()', '[]', '{}'
    char == full_char[0]
  when '""', "''"
    char_count.zero?
  end
end

p balanced?('What [is] this?') == true
p balanced?('What" is this[]') == false
p balanced?("What'' is this?") == true
p balanced?("What { 'is' this\" ]") == false
p balanced?("\"What is this''\"") == true

p balanced?("What's this?") == true
# Should return true, since the single quote is used as an apostrophe
# - but will return false

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
p balanced?('What ())(is() up') == false