# Does my List Include this?
=begin
Write a method named include? that takes an Array and a search value as arguments
Return true if the search value is in the array and false otherwise.
- Do not use Array#include?

Input: An Array and a value to search for in that Array
Output: A boolean ; true if value is in array, false otherwise.
 - dont use #include? 

Examples:
  include?([1,2,3,4,5], 3) == true
  include?([1,2,3,4,5], 6) == false
  include?([], 3) == false
  include?([nil], nil) == true
  include?([], nil) == false

Data: 
  The given input Array - probably need to iterate through it searching for
  the value

Algorithm:
Given an input Array and a search value, array and search_value:
  Iterate through array. For each element:
    If the current element is equal to search_value, stop iteration and 
      return true
  Return false
=end

def include?(array, search_value)
  array.any? { |element| element == search_value } 
end


p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false