# Name Swapping
# Write a method that takes a string containing a first name, space, and last name,
#   and returns a new string containing the last name, comma, space, and first name

# Input: 
#   A String - contains first name, space, last name
#   - Can assume inputs are valid? ie. match provided format?
# Output:
#   Another String - contains last name, comma, space, first name

# Example:
# swap_name('Joe Roberts') == 'Roberts, Joe'

# Data:
#   The string given as input 
#   - Will need to extract first and last name
#   The string that we will build and return as output

# Algorithm:
# Given a name string as input, name:
# Extract the first and last name from name
#   (Assuming inputs will be valid:)
#   Split name on spaces => 2 strings
#     assign each value to first_name/last_name
# Put the return string together:
#   lastname, firstname

def swap_name(name)
  first_name, last_name = name.split
  "#{last_name}, #{first_name}"
end

p swap_name('Joe Roberts') == 'Roberts, Joe'