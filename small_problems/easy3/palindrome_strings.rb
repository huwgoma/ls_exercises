# Palindrome (Part 1)

# Input: String (str)
# Output: true, if str is a palindrome
#   case-insensitive, ignore all non-alphanumeric characters 

# eg.
# palindrome?('madam') == true
# palindrome?('Madam') == false          # (case matters)
# palindrome?("madam i'm adam") == false # (all characters matter)
# palindrome?('356653') == true

# Alg:
#   Given a string argument, str:
#   downcase the string (case-insensitive)
#   delete all characters that do not match a-z or 0-9 (save result)
#   reverse the str and compare to original str


def palindrome?(str)
  str = str.downcase.delete('^a-z0-9')
  str == str.reverse
end

p palindrome?('madam') == true
p palindrome?('Madam') == true           # (case does not matter)
p palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p palindrome?('356653') == true
p palindrome?('356a653') == true
p palindrome?('123ab321') == false


# Further Exploration: 
# Write a method that determines whether an Array OR String argument is palindromic.
# Palindromic Array: The values appear in the same sequence forwards/backwards
# Do not use conditionals (if/unless/case)

# Input: String OR Array
# Output: true if the argument is palindromic
#   String: Characters appear in the same sequence forwards and backwards
#     Case-sensitive, and all characters should be checked
#   Array: Array values appear in the same sequence forwards and backwards.

# eg.
# double_palindrome?('madam') == true
# double_palindrome?('Madam') == false # (Case)
# double_palindrome?("Madam I'm Adam") == false # (' character)
# double_palindrome?([13, 3, 13]) == true
# double_palindrome?([13, 3, 31]) == false

# Alg: 
#   Given an argument (either string or array), arg:
#     Case-sensitive/all characters checked -> Do not sanitize the input in any way
#   String: Check if the string value is equal to the string reversed value
#   Array: Check if the array elements appear in the same order when reversed.

def double_palindrome?(arg)
  arg == arg.reverse
end

# Both Strings and Array respond to the #reverse method, 
# returning a new object that is a copy of the calling object 
# with its characters/values reversed

p double_palindrome?('madam') == true
p double_palindrome?('Madam') == false # (Case)
p double_palindrome?("Madam I'm Adam") == false # (' character)
p double_palindrome?([13, 3, 13]) == true
p double_palindrome?([13, 3, 31]) == false