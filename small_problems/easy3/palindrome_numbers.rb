# Palindromic Numbers

# Input: Integer (int)
# Output: true (if integer is palindromic).
#         false otherwise.

# eg.
# palindromic_number?(34543) == true
# palindromic_number?(123210) == false
# palindromic_number?(22) == true
# palindromic_number?(5) == true

# Alg:
#   Given an Integer argument, int
#   Convert int to a string
#   Check if the string is equal to the string reversed

def palindromic_number?(int)
  str = int.to_s
  str == str.reverse
end

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true