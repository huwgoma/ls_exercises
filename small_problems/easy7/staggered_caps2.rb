# Staggered Caps 2
# Modify the method from the previous exercise 

# def staggered_case(str, first_upcased: true)
#   upcase = first_upcased
#   str.chars.map do |char|
#     char = upcase ? char.upcase : char.downcase
#     upcase = !upcase
#     char
#   end.join
# end

# so that it ignores non-alphabetic characters when determining whether it should 
# uppercase or lowercase each letter. Non-alphabetic characters should still be
# returned - they just don't count as a 'character' for toggling the case.

# Example:
# staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
# staggered_case('ALL CAPS') == 'AlL cApS'
# staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

# Algorithm: 
# Given a string and boolean as input, str and first_upcased:
#   Set upcase variable to first_upcased (true/false)
#   (Transform) Iterate over each character of str. For each character:
#     If the current character is non-alphabetic, skip to the next character
#     If upcase is true, upcase the current character
#     Otherwise, downcase the current character
#   => array of transformed chars
#   Join array of chars together and return the resulting string

ALPHABET = Array('a'..'z') + Array('A'..'Z')

def staggered_case(str, first_caps: true)
  upcase = first_caps
  str.chars.map do |char|
    next char unless ALPHABET.include?(char)
    char = upcase ? char.upcase : char.downcase
    upcase = !upcase
    char
  end.join
end

# Further Exploration:
# Modify this method so the caller can determine whether non-alphabetic characters
# should be counted when determining upper/lowercase state.
# - count_all: true => Non-alphabetic chars ARE considered characters when toggling
#     case
#              false => Non-alphabetic chars are NOT considered chars when
#     toggling case.

# Algorithm:
#   If skip_non_alpha is true, skip over non-alphabetic chars
#   If skip_non_alpha is false, do not skip non-alphabetic chars
# Iterate over each character of string. For each character:
#   If skip non alpha is true, then check if the current char is alphabetic.
#     if not alphabetic, skip the rest of the current iteration.

def staggered_case(str, first_caps: true, skip_non_alpha: true)
  upcase = first_caps
  str.chars.map do |char|
    if skip_non_alpha
      next char unless ALPHABET.include?(char)
    end
  
    char = upcase ? char.upcase : char.downcase
    upcase = !upcase
    char
  end.join
end



p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

p staggered_case('I Love Launch School!', skip_non_alpha: false) == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL CAPS', skip_non_alpha: false) == 'AlL CaPs'
p staggered_case('ignore 77 the 444 numbers', skip_non_alpha: false) == 'IgNoRe 77 ThE 444 NuMbErS'