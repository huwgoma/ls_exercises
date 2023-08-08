# Searching 101

# Input: 6 separate Integers (from User)
# Output: True if the 6th number appears in the first 5 numbers.
#   (Output message accordingly)

# eg. 25, 15, 20, 17, 23, 17
# => true - 17 appears in [25, 15, 20, 17, 23]

# 25, 15, 20, 17, 23, 18
# => false - 18 does not appear in [25, 15, 20, 17, 23]

# Alg:
#   Initialize an empty array [] to hold the first 5 numbers
#   Iterate 5 times (i=0). Prompt the user to enter the nth number, then add 
#     the number to the numbers array
#   Prompt the user for a 6th number; save to number6 variable
#   Check if the numbers array already contains an instance of number6 integer
#     If true -> number6 appears in numbers
#     If false -> number6 does not appear in numbers

numbers = []
5.times do |i|
  puts "Please enter number ##{i + 1}:"
  numbers << gets.to_i
end

puts "Please enter number #6:"
number6 = gets.to_i

if numbers.include?(number6)
  puts "The number #{number6} appears in #{numbers}."
else
  puts "The number #{number6} does not appear in #{numbers}."
end