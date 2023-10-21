# Combining Arrays
=begin
Write a method that takes 2 arrays as arguments, and returns an array containing
all values from the argument arrays
- The returned array should contain no duplicate values (even if the original
arrays have dupes)

Input: Two Arrays
Output: One Array (a new Array) - contains all values from the two given arrays,
  but uniquely (so only one of each value; no dupes)

Examples:
  merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

Data:
  The two given Arrays containing whatever elements
  The output array that we will build and return

Algorithm:
Given two arrays, arr1 and arr2:
  Combine the two arrays into one.
  Iterate through the resulting array. For each element:
    Add the current element to the output array, unless the output array
      already includes that element.
Return the output array

=end

def merge(arr1, arr2)
  arr = arr1 + arr2
  output = []
  arr.each do |element|
    output << element unless output.include?(element)
  end
  output
end

def merge(arr1, arr2)
  arr = arr1 + arr2
  arr.each_with_object([]) do |element, result|
    result << element unless result.include?(element)
  end
end

def merge(arr1, arr2)
  arr = (arr1 + arr2).uniq
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

