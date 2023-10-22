# Staggered Caps (Part 1)
# Write a method that takes a String and returns a -new- String containing the 
#   original string's value, but using a staggered capitalization scheme.
#   => Every other character is capitalized
#   Non-alphabetic characters should remain unchanged
#   Non-alphabetic characters DO count as a character when switching capitalization

# Input: 
#   A String
# Output:
#   A new string with the same characters, but every other character is capitalized
#   - The first character is always capitalized

# Examples:
  # staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
  # staggered_case('ALL_CAPS') == 'AlL_CaPs'
  # staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

# Data: 
#   The String given as input - probably need to iterate over its characters
#   The string that we will build and return as output

# Algorithm:
# Given a string as input, str:
#   (transform) Iterate through str's characters (with index). For each character:
#     If the index is even, apply a upcase to the current character
#     Otherwise, apply a downcase.
#   => array of characters
#   Join the array of characters back together into a string and return that string

def staggered_case(str)
  str.chars.map.with_index do |char, index|
    index.even? ? char.upcase : char.downcase
  end.join
end

# Further Exploration: 
# Modify the method so the caller can request the first character be downcased
#   rather than upcased -> Switch the starting letter's case -> Ripple down

# Algorithm: 
# first_upcased - default to true
# Given a string (str) and a boolean (first_upcased):
#   Initialize a new boolean variable, upcase = true/false - true or false 
#     depending on the value of first_upcased (if true, upcase = true)
#   (transform) Iterate through str's characters. For each character:
#     If upcase is true, apply upcase to current character
#     Otherwise, apply downcase to current character
#     Toggle upcase - if true, switch to false; if false, switch to true.
#     Return the character (reassign char to result of upcase/downcase)
#   => array of characters 
#   Join arrayof chars back into a string, return that string.

def staggered_case(str, first_upcased: true)
  upcase = first_upcased
  str.chars.map do |char|
    char = upcase ? char.upcase : char.downcase
    upcase = !upcase
    char
  end.join
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'


p staggered_case('I Love Launch School!', 
  first_upcased: false) == 'i lOvE LaUnCh sChOoL!'

p staggered_case('ALL_CAPS', first_upcased: false) == 'aLl_cApS'

p staggered_case('ignore 77 the 444 numbers', 
  first_upcased: false) == 'iGnOrE 77 tHe 444 nUmBeRs'