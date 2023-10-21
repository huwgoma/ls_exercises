# Halvsies
=begin
Write a method that takes an Array as an argument, and returns two Arrays (nested
subarrays) that contain the first and second half of the original Array.
  If the original array has an odd number of elements, the middle element
  should be placed into the first-half Array.

Input:
  One Array
Output: 
  A new Array containing two subarrays, each containing the first/second half
  of the input Array
  - If odd number of elements, the middle element goes into the first
    eg. [1,2,3] => [[1, 2], [3]]

Examples:
  halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
  halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
  halvsies([5]) == [[5], []]
  halvsies([]) == [[], []]

  [1, 2, 3, 4, 5] => indexes 0 1 2 | 3 4, size 5. 5 / 2.0 = 2.5
  [1, 2, 3, 4]    => indexes 0 1 | 2 3,   size 4  4 / 2.0 = 2.0

Data:
  The given input Array
  The two subarrays (first/last half)
  The output array nesting those two subarrays

Algorithm:
Given an input Array, array:
  Initialize two empty arrays, first_half and second_half = []/[]
  Iterate through array with index as well. For each element:
    If the element's index is less than the array size divided by 2 (float),
      add it to first_half
    Otherwise add it to second_half
  Return an array containing first_half and second_half
=end

def halvsies(array)
  first_half, second_half = [], []
  cutoff = array.size / 2.0
  array.each_with_index do |element, index|
    half = index < cutoff ? first_half : second_half
    half << element
  end
  [first_half, second_half]
end

# Algorithm with partition
# Iterate through array with index; for each element:
#   If index is less than array size / 2.0, add to first subarray (truthy)
#     otherwise add to second

def halvsies(array)
  cutoff = array.size / 2.0
  array.partition.with_index do |element, index|
    index < cutoff
  end
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]