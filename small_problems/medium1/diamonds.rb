# Diamonds
# Write a method that displays a 4-pointed diamond in a NxN grid, where N is an 
# odd integer given as an argument.
# - You may assume the argument will always be an odd integer.

# Input:
#   An odd integer, representing the length and width of the diamond (middle)
#   n x n grid; every line has n characters, and there are n lines
# Output:
#   A 4-pointed diamond, printed 

# Examples:
# diamond(1)
# *

# diamond(3)
#  *
# ***
#  *

#  diamond(9)
#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *

# Data:
#   The integer given as input (representing the length/width of the diamond grid)

# Algorithm:
# Given an integer <n> representing the length and width of the grid:
# Loop n times. For each loop:
#   Print a line consisting of diamonds (*) and spaces
#     Calculate the number of diamonds on the current line
#     - number of diamonds starts at 1
#     - increases by 2 on each iteration
#     - peaks at n
#     - decreases by 2 on each iteration after peaking
#       increment = ?
#     Create a string that contains the calculated number of diamonds, and 
#       is padded with spaces to a total of n characters long
#   Print the resulting string

def diamond(n)
  number_of_stars = 1
  increment = 2
  
  n.times do
    line = ('*' * number_of_stars).center(n)
    number_of_stars += increment
    increment = -2 if number_of_stars == n
    puts line
  end
end


diamond(1)
diamond(3)
diamond(9)

# Further Exploration: Modify the method so it only prints the diamond's outline
# hollow_diamond(5)

#   *
#  * *
# *   *
#  * *
#   *

# Algorithm: 
# Given an integer n representing the grids length/width:
# Loop n times; for each loop:
#   Print a line consisting of stars and spaces
#     Calculate the inner width of the line (inner portion, including stars)
#     eg. 5: 1, 3, 5, 3, 1
#     If inner_width = 1, add a single star and pad with spaces to n length
#     Otherwise, add width - 2 spaces, add 2 stars, pad with spaces to n length
#     Increment width by increment
#     If width = n, switch increment to -2
#   Print the resulting string

def hollow_diamond(n)
  width = 1
  increment = 2

  n.times do
    puts width == 1 ? '*'.center(n) : "*#{' ' * (width - 2)}*".center(n)

    width += increment 
    increment = -2 if width == n 
  end
end

hollow_diamond(9)
