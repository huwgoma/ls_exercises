require 'pry'

def five_in_sequence?(array)
  subarrays = subarrays(array, 5)
  subarrays.any? { |array| in_sequence?(array) }
  binding.pry
end

def subarrays(array, size)
  array.each_with_object([]).with_index do |(int, arrays), idx|
    arrays << array.slice(idx, size)
    return arrays if idx >= (array.size - size)
  end
end

def in_sequence?(array)
  first_value = array.first

  array[1..-1].all? do |int|
    int == first_value += 1
  end
end

p five_in_sequence?([2, 3, 5, 6, 7, 8, 9])
p five_in_sequence?([2, 3, 5, 7, 8, 9, 10])

# in_sequence?
# Input: An array
# Output: True if the array consists of numbers that are contiguous (1 apart)

# Examples:
# [4, 5, 6, 7, 8] => true
# [4, 5, 6, 7, 9] => false

# Data:
# The array given as input
# - Iterate through each integer. For each integer:
# - Look ahead at the next integer. If the next integer is equal to
#   current int + 1, continue iterating; otherwise, return false
#   - Need to skip the last element