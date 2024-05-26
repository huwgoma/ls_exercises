# Bubble sort with blocks

# Bubble Sort Algorithm:
# - Multiple iterations through the array. On each pass, each pair of 
#   consecutive elements is compared. 
# - If the first element is greater than the second, the two elements
#   are swapped; otherwise, they remain in place.
# - If a complete iteration is made without any swaps, the sorting is 
#   complete.

# Write a bubble sort method that takes a block specifying how to sort
# the array.

# Input: 
# - An array (to be sorted, destructively)
# - A block, specifying how elements should be sorted (optional)
#   - If no block is given, default to sorting in ascending order.

# Output: 
# - The same array, sorted

# Examples:
# array = [5, 3, 7]
# bubble_sort!(array) # Default to sorting in ascending order if no block
# array == [3, 5, 7]

# array = [5, 3, 7]
# bubble_sort!(array) { |first, second| first >= second }
# # If the block returns true(thy?), do not swap the two elements.
# array == [7, 5, 3]

# Data/Algorithm:
# - Array given as input
# - Loop through the array. For each loop:
#   - Set a flag, swapped = false
#   - Iterate through the array, excluding the last element. For each element:
#     - Compare the current element against the next element.
#       - If a block is given, yield current and next elements. Otherwise, compare
#         current and next elements using size.
#       - If the block returns falsey, swap 2 elements.
#       - If the comparison returns true, swap 2 elements.
#     - If a swap is made, set swapped = true
#   - EOI => Go back to loop
# - Break loop if swapped is still false.
# => Return array.

# def bubble_sort!(array)
#   loop do
#     swap_made = false

#     array[0..-2].each_with_index do |element, index|
#       next_element = array[index + 1]
#       skip = block_given? ? yield(element, next_element) : element <= next_element
#       next if skip 

#       array[index], array[index + 1] = array[index + 1], array[index]
#       swap_made = true
#     end
#     break unless swap_made
#   end
#   array
# end

# array = [5, 3]
# bubble_sort!(array)
# p array == [3, 5]

# array = [5, 3, 7]
# bubble_sort!(array) { |first, second| first >= second }
# p array == [7, 5, 3]

# array = [6, 2, 7, 1, 4]
# bubble_sort!(array)
# p array == [1, 2, 4, 6, 7]

# array = [6, 12, 27, 22, 14]
# bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
# p array == [14, 22, 12, 6, 27]

# array = %w(sue Pete alice Tyler rachel Kim bonnie)
# bubble_sort!(array)
# p array == %w(Kim Pete Tyler alice bonnie rachel sue)

# array = %w(sue Pete alice Tyler rachel Kim bonnie)
# bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
# p array == %w(alice bonnie Kim Pete rachel sue Tyler)


# Further Exploration ========================
# Modify your solution so that it only passes one element to the block at a time.
# - The block should perform a transformation on the argument, and bubblesort!
#   itself should use <= to compare the two values.

# Algorithm:
# - loop through the array; iterate through the array. for each element:
#   - Retrieve next element.
#   - If a block is given:
#     - yield the current and next element to the block (separately), then 
#       compare the block return values using <=.
#     - If the current element is less than/equal to next element, skip to next
#       iteration
#   - If no block is given:
#     - compare current and next elements directly using <= 


# Example:
# def bubble_sort_by!(array)
#   loop do
#     swap_made = false

#     array[0..-2].each_with_index do |element, index|
#       next_element = array[index + 1]
      
#       skip = if block_given?
#                yield(element) <= yield(next_element)
#              else
#                element <= next_element
#              end       
      
#       next if skip

#       array[index], array[index + 1] = array[index + 1], array[index]
#       swap_made = true
#     end
#     break unless swap_made
#   end
#   array
# end

# array = %w(sue Pete alice Tyler rachel Kim bonnie)
# bubble_sort_by!(array) { |value| value.downcase }
# # Sort the array using the values obtained by calling downcase on each 
# #  element of the array. (like sort_by)
# p array == %w(alice bonnie Kim Pete rachel sue Tyler)