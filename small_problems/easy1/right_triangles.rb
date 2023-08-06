# Right Triangles
# Input: Positive Integer, n
# Output: Print a right-angle triangle with n stars on each length.

# eg. triangle(5)
#     *
#    **
#   ***
#  ****
# *****

# Algorithm:
#   Have to print line by line; n lines.
#   eg. First line is 4 spaces + 1 star
#       Second is 3 spaces + 2 stars, ... etc.
#   Loop n times. (i = 0). For each loop:
#     stars = i + 1 
#     spaces = n - stars
#     Create a new string using *:
#       (' ' * spaces) + ('*' * stars)
#     Print the string

# def triangle(n)
#   n.times do |i|
#     stars = i + 1
#     spaces = n - stars

#     puts "#{' ' * spaces}#{'*' * stars}"
#   end
# end


# Further Exploration: Modify the solution so that you can display the triangle
#   with its right angle at any corner (ie. any orientation).

# Input: Integer (n); must be positive.
#        String (corner); must be either TL, TR, BL, BR (Default = BR)
#         Describes which corner the right angle will be located at.

# Output: Print a right-angle triangle with n stars on each length;
#         The triangle will be oriented according to its corner value.

# eg. triangle(3, TL)
# ***
# **
# *

# triangle(3, TR)
# ***
#  **
#   *

# triangle(3, BL)
# *
# **
# ***

# triangle(3) (corner=BR)
#   *
#  **
# ***

# Algorithm:
#   Given an Integer n and a String corner:
#   Calculate the number of starting stars; depends on corner value
#     If corner string contains 'T': 
#       stars = n; otherwise, stars = 1
#       delta = -1; otherwise, 1.
#   Iterate n times (printing n lines). (i = 0)
#     Each line is n characters long.
#       Initialize a new string = '*' * stars
#       If corner string contains 'R', pad the string with spaces, 
#         until length n is reached (right justify)
#       Print the string.


#     Calculate the number of spaces (n - stars)
#     If corner string contains 'L', string is stars + spaces
#     If corner string contains 'R', string is spaces + stars
#     Print the string
#     Decrement or increment the number of stars (T -> decrement, B -> increment)

def triangle(n, corner='BR')
  stars, delta = corner.include?('T') ? [n, -1] : [1, 1]
  n.times do 
    str = '*' * stars
    str = str.rjust(n, ' ') if corner.include?('R')
    puts str
    stars += delta
  end
end

triangle(3, 'TL')
triangle(3, 'TR')
triangle(3, 'BL')
triangle(3)

