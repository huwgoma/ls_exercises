# Grocery List
# Write a method that takes an array of fruits with quantities and 
#   converts it into an array containing the correct number of each fruit.

# Input: 
#   An array of subarrays; each subarray contains a fruit (string) and an 
#     integer representing how many of that fruit we want
# Output:
#   A new array? containing the specified number of each fruit 
#   eg. apple, 3 => an array containing 3 instances of 'apple'

# Examples:
# buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
#   ["apples", "apples", "apples", "orange", "bananas","bananas"]

# Data:
#   The nested array of fruit/quantity subarrays given as input
#   The flat array of fruit strings that we will build and return

# Algorithm:
# Given a nested array of fruit subarrays, grocery_list:
# Initialize a new empty array, fruits = []
# Iterate over grocery_list. For each fruit subarray:
#   Add the first element of the subarray (fruit string) to fruits,
#   <n> number of times (where n is the second element of the subarr (qty))
# Return fruits

def buy_fruit(grocery_list)
  grocery_list.each_with_object([]) do |fruit_qty, fruits|
    fruit, quantity = fruit_qty
    quantity.times { fruits << fruit }
  end
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

# LS Solution:
# Transformation
# Algorithm:
# Given a nested array of fruit subarrays, grocery_list:
# (Transformation) iterate over grocery list. For each fruit subarray:
#   Create a new subarray that consists of <n> occurrences of the fruit string
# => An array of nested subarrays; each subarray contains n occurrences of
#   the respective fruit string
# Flatten the array out into a 1d array.

def buy_fruit(grocery_list)
  grocery_list.map do |fruit_qty|
    fruit, quantity = fruit_qty
    [fruit] * quantity
  end.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]