# Multiplicative Average
# Write a method that takes an Array of integers, multiplies all the numbers 
#   together, divides the total product by the number of entries in the Array,
#   then prints the result rounded to 3 decimal places.
# - You may assume the array is non-empty

# Input: 
#   An Array of integers
# Output:
#   A printed string describing the multiplicative average of the integers in Array
#     rounded to 3 decimal places. 
#   - Average = total product / total # of elements
#   Like regular average, but multiplying instead of adding

# Examples
# show_multiplicative_average([3, 5])                # => The result is 7.500
# show_multiplicative_average([6])                   # => The result is 6.000
# show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667

# Data: 
#   The array given as input
#     Will probably need to iterate over the array to calculate total product

# Algorithm:
# Given an array of integers, integers:
# Calculate the total product of the integers
#   Initialize a result variable, result = 1
#   Iterate over integers. For each integer:
#     Increment result by multiplying it against the current integer.
#   => total product
# Calculate the multiplicative average of the integers
#   Divide the total product by the number of elements in integers
#     Round the result to 3 decimal places (float division)
#   => multiplicative average
# Print a string describing the result

def show_multiplicative_average(integers)
  total_product = integers.reduce(&:*)
  average = (total_product.fdiv(integers.size)).round(3)
  puts "The result is #{format('%.3f', average)}"
end

show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667

# Further Exploration:
# def show_multiplicative_average(numbers)
#   product = 1.to_f
#   numbers.each { |number| product *= number }
#   average = product / numbers.size
#   puts "The result is #{format('%.3f', average)}"
# end

# What happens if you omit the call #to_f on the first line?
# The average calculation will be done with integer division instead of float
#   division, leading to incorrectly rounded numbers (all numbers will be rounded
#   to .000)