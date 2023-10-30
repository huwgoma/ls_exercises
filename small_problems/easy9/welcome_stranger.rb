# Welcome Stranger
# Write a method that takes an array and a hash.
# - The array will contain 2+ elements representing a person's name (when
# joined with spaces)
# - The hash will contain two keys, title and occupation, and the corresponding
#   values.

# The method should return a greeting containing the person's full name, title, 
#   and occupation.

# Input: 
#   An Array: 2+ elements representing a person's first/middle/last name
#   A hash containing two keys (title/occupation) and a corresponding string value
# Output:
#   A String containing the person's name, title, and occupation (greeting)

# Examples:
# greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => "Hello, John Q Doe! Nice to have a Master Plumber around."

# Data: 
#   The name array and the career hash given as input
#   The string that we will build and return as output

# Algorithm:
# Given an array of strings (names) and a hash (career):
#   Extract the full name from names.
#     - Join names together with a space.
#   Extract the title and occupation from career.
#     - Retrieve career[title] and career[occupation]
#   Put the return string together.

def greetings(names, career)
  full_name = names.join(' ')
  profession = "#{career[:title]} #{career[:occupation]}"

  "Hello, #{full_name}! Nice to have a #{profession} around."
end

p greetings(['John', 'Q', 'Doe'], 
  { title: 'Master', occupation: 'Plumber' }) == "Hello, John Q Doe! Nice to have a Master Plumber around."