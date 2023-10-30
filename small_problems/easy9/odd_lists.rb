# Odd Lists
# Write a method that takes an Array and returns a new Array containing
#   every other element from the given Array. 
# - The values in the returned array should be the 1st, 3rd, 5th, etc. elements
# of the argument array

# Input: An array of elements
# Output: A new array containing every other element from the input array, 
#   starting with the 1st element (index 0)

# Examples:
# oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
# oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
# oddities(['abc', 'def']) == ['abc']
# oddities([123]) == [123]
# oddities([]) == []
# oddities([1, 2, 3, 4, 1]) == [1, 3, 1]

# Data: 
#   The array that is given as input 
#   The array that we will build and return as output 

# Algorithm:
# Given an array of elements as input, array:
# (Selection) iterate through array with index. For each element:
#   If the index is even, select the element (otherwise dont)
# => array of every other element starting at index 0

def oddities(array)
  array.select.with_index do |_element, index|
    index.even?
  end
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
p oddities([1, 2, 3, 4, 1]) == [1, 3, 1]


# Further Exploration:
# Write a method that returns the 2nd, 4th, 6th, etc.  elements (2 ways)

# Algorithm: 
# Given an array of elements as input, array:
# (Selection) - iterate through array with index. For each element:
#   If index is odd, select the element
# => array of every other element starting at index 1 (2nd)

def evenities(array)
  array.select.with_index do |_element, index|
    index.odd?
  end
end

def evenities(array)
  evens = []
  array.each_with_index do |element, index|
    evens << element if index.odd?
  end
  evens
end

p evenities([2, 3, 4, 5, 6]) == [3, 5]
p evenities([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
p evenities(['abc', 'def']) == ['def']
p evenities([123]) == []
p evenities([]) == []
p evenities([1, 2, 3, 4, 1]) == [2, 4]