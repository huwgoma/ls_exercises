# Get Middle Character

# Input: String (str); must not be empty
# Output: A String containing the middle character(s) of str
#   If str.length is odd (abc), return 1 character (b)
#   If str.length is even (abcd), return 2 characters (bc)

# eg. 
# center_of('I love ruby') == 'e'
# center_of('Launch School') == ' '
# center_of('Launch') == 'un'
# center_of('Launchschool') == 'hs'
# center_of('x') == 'x'

# A:
#   Given a String argument, str:
#   Initialize an empty string, middle = ''
#   If str is empty, return middle ('')
#   If str length is odd, divide the length by 2 and retrieve the char at 
#     that index (which will be the middle char)
#       str[length / 2] => returns the middle char

#   If str length is even, retrieve the two middle characters.
#     length / 2 gives the right middle character, so (length / 2 ) - 1
#     returns the left middle character.
#     Start at [length/2 -1] and take 2 characters.

#   Reassign the middle string to the return value of the retrieval
#   Return middle

def center_of(str)
  return '' if str.empty?

  if str.length.odd?
    str[str.length / 2]
  else
    str[((str.length / 2) - 1), 2]
  end
end


puts center_of('I love ruby') == 'e'
puts center_of('Launch School') == ' '
puts center_of('Launch') == 'un'
puts center_of('Launchschool') == 'hs'
puts center_of('x') == 'x'