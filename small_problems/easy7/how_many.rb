# How Many
# Write a method that counts and prints the number of occurrences 
# of each element in the given array
# - Words are case-sensitive; eg. suv is not equal to SUV
# Print each element along the number of occurrences.

# Input: An array of elements
# Output: Printing each unique element value along with how many times that
#   value appears in the array

# Examples
# vehicles = [
#   'car', 'car', 'truck', 'car', 'SUV', 'suv', 'truck',
#   'motorcycle', 'motorcycle', 'car', 'truck', 
# ]

# count_occurrences(vehicles)

# car => 4
# truck => 3
# SUV => 1
# suv => 1
# motorcycle => 2

# Data: 
#   The given input array of elements
#   Probably will build a hash; 
#     keys represent each unique element, values represent the # of occurences
#       of that element.

# Algorithm:
# Given an array of elements, array:
# Initialize a new empty Hash with default value 0, count = {} (0)
# Iterate through array. For each element:
#   Increment the corresponding key-value pair in Hash by 1
#   eg. 'car' ; hash['car'] += 1
#   => Hash of element => frequency pairs
# Iterate through the count hash. For each key-value pair:
#   Print out the key => print out the value

def count_occurrences(array)
  count = Hash.new(0)
  array.each { |element| count[element] += 1 }
  count.each { |element, freq| puts "#{element} => #{freq}" }
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'suv', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck', 
]

#count_occurrences(vehicles)
# car => 4
# truck => 3
# SUV => 1
# suv => 1
# motorcycle => 2

# Further Exploration: Solve the problem with words being case-insensitive
#   eg. 'suv' == 'SUV'

# Algorithm: 
# Iterate through array. For each element:
#   Downcase the element, then increment the corresponding key-value pair by 1

def count_occurrences(array)
  count = Hash.new(0)
  array.each { |element| count[element.downcase] += 1 }
  count.each { |element, freq| puts "#{element} => #{freq}" }
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'suv', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck', 
]

count_occurrences(vehicles)
# car => 4
# truck => 3
# suv => 2
# motorcycle => 2