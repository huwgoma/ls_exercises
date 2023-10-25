# Palindromic Substrings
# Write a method that returns a list of all substrings of a string that are 
#   palindromic. 
#   -> Each substring must consist of the same character sequence forwards
#   as backwards
#   - Returned array should be arranged in the same sequence as the substrings 
#   appear in the string
#   - Duplicates should be included

# Use the #substrings method from last exercise.

# Input: A String
# Output: An array of the substrings within the given string that are palindromic
#   -Palindrome: Sequence of characters that are identical when reversed
#     - Characters are case-sensitive
#     - All characters should be considered
#     - Single characters are NOT palindromes
#     eg. AbcbA => palindromic; Abcba => not palindromic; Abc-bA => not palindromic

# Examples:
# palindromes('abcd') == []
# palindromes('madam') == ['madam', 'ada']
# palindromes('hello-madam-did-madam-goodbye') == [
#   'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#   'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#   '-madam-', 'madam', 'ada', 'oo'
# ]
# palindromes('knitting cassettes') == [
#   'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
# ]

# Data: 
#   The String given as input
#   The array of palindromic substrings that we will output

# Algorithm:
# Given a string as input, str:
# Create an array of all substrings within str.
#   -> Use #substrings method
# Filter the substrings list for only the substrings that are identical 
#   to their reversed form
#   -> Iterate through substrings. For each substring:
#     Select the current substring to add to the return value if its value
#       is identical to its value reversed
# Return the filtered substrings list.

def leading_substrings(str)
  str.length.times.map { |i| str.slice(0..i) }
end

def substrings(str)
  substrings = []
  str.length.times do |index|
    substrings << leading_substrings(str.slice(index..-1))
  end
  substrings.flatten
end

def palindromes(str)
  substrings = substrings(str)
  substrings.select do |substring|
    palindrome?(substring)
  end
end

def palindrome?(str)
  str.length > 1 && str == str.reverse
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

# Further Exploration:
# Modify this method to ignore non-alphanumeric characters and case.
#   (When determining whether a substring is palindromic?)
#   - Alphanumeric characters are the alphabetic characters (upper/lower) and 
#   number digits.
# Ignore?
# eg. 'Madam-' IS palindromic - return 'Madam-' or 'madam' ?
# => Return 'Madam-' (original substring)

# Algorithm:
# Given an input string, str:
# Specify two additional optional parameters:
#   ignore_case (false by default)
#     - If true, substrings are palindromic even if they have different cases
#     eg. ignore_case = false => 'Madam' is not palindromic
#         ignore_case = true => 'Madam' IS palindromic.
#   alphanumeric_only (false by default)
#     - If true, substrings are palindromic even if there are non-alphanumeric
#       characters that would make it non-palindromic
#     eg. alphanumeric_only = false => 'mad-am' is not palindromic
#         alphanumeric_only = true => 'mad-am' IS palindromic
#     

# Extract all possible substrings from str.
# (Selection) iterate through substrings; for each substring:
#   Determine whether the current substring is a palindrome.
#     New Options:
#     If ignore_case is true, downcase the string before checking for palindrome
#     If alphanumeric_only is true, remove any non-alphanumeric characters 
#       before checking for palindrome.

def leading_substrings(str)
  str.length.times.map { |i| str.slice(0..i) }
end

def substrings(str)
  substrings = []
  str.length.times do |index|
    substrings << leading_substrings(str.slice(index..-1))
  end
  substrings.flatten
end

# 
def palindromes(str, ignore_case: false, alphanumeric_only: false)
  substrings = substrings(str)
  substrings.select do |substring|
    substring = substring.downcase if ignore_case
    substring = remove_non_alphanumerics(substring) if alphanumeric_only
    palindrome?(substring)
  end
end

ALPHANUMERIC = Array('a'..'z') + Array('A'..'Z') + Array('0'..'9')

def remove_non_alphanumerics(str)
  str.chars.select do |char|
    ALPHANUMERIC.include?(char)
  end.join
end

def palindrome?(str)
  str.length > 1 && str == str.reverse
end


# p palindromes('abcd') == []
# p palindromes('madam') == ['madam', 'ada']
# p palindromes('hello-madam-did-madam-goodbye') == [
#   'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#   'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#   '-madam-', 'madam', 'ada', 'oo'
# ]
# p palindromes('knitting cassettes') == [
#   'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
# ]

p palindromes('madA m', 
  ignore_case: true, alphanumeric_only: true) == ['madA m', 'adA', 'adA ']

p palindromes('madA m', 
  ignore_case: false, alphanumeric_only: true) == []

p palindromes('madA m', 
  ignore_case: true, alphanumeric_only: false) == ['adA']

p palindromes('madA m', 
  ignore_case: false, alphanumeric_only: false) == []
