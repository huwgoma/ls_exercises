# Bubble Sort
# A bubblesort works by iterating through the Array multiple times.
#   - On each pass, each pair of consecutive elements is compared. If the 
#   first elements is greater than the second, swap the two elements.
#   - If a complete pass is made without performing any swaps, the Array is 
#   considered fully-sorted.

# eg. [6, 2, 7, 1, 4]
#   6 <=> 2 -> swap -> [2, 6, 7, 1, 4]
#   6 <=> 7 -> no swap -> [2, 6, 7, 1, 4]
#   7 <=> 1 -> swap -> [2, 6, 1, 7, 4]
#   7 <=> 4 -> swap -> [2, 6, 1, 4, 7]
# Did we make any swaps? Yes -> Iterate again
#   2 <=> 6 -> no swap
#   6 <=> 1 -> swap -> [2, 1, 6, 4, 7]
#   6 <=> 4 -> swap -> [2, 1, 4, 6, 7]
#   6 <=> 7 -> no swap
# Swaps? Yes -> Iterate again
#   2 <=> 1 -> swap -> [1, 2, 4, 6, 7]
#   2 <=> 4, 4 <=> 6, 6 <=> 7 -> no swap
# Swaps? Yes -> Iterate again
#   1 <=> 2, 2 <=> 4, 4 <=> 6, 6 <=> 7 -> no swaps
# Swaps? No -> Sort complete

# Write a method that takes an Array and returns the same Array with elements
#   sorted via the bubblesort algorithm. 
# - Assume the Array contains at least two elements.

# Input: An Array containing at least 2 elements
# Output: The same Array but destructively sorted (ie. array order is altered)

# Examples:
# array = [5, 3]
# bubble_sort!(array)
# array == [3, 5]

# array = [6, 2, 7, 1, 4]
# bubble_sort!(array)
# array == [1, 2, 4, 6, 7]

# array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
# bubble_sort!(array)
# array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

# Data:
# The Array given as input
# - Will need to iterate through the array, multiple times, until 
#   no swaps are made
# - ie. set swap flag to false; flip to true if a swap is made.

# Algorithm:
# Given an array as input, array:
# Initialize loop:
#   Create a flag variable, swap_made = false
#   Iterate through array. For each element:
#     Compare the current element with the next element. 
#     - If the current element is larger than the next element, swap the positions
#       of the two elements; set swap_made to true
#   Exit loop if swap_made is false (eg. break unless a swap was made).

def bubble_sort!(array)
  loop do
    swap_made = false

    array.each_with_index do |element, index|
      comparison = element <=> array[index + 1]
      if comparison == 1
        array[index], array[index + 1] = array[index + 1], array[index]
        swap_made = true
      end
    end
    break unless swap_made
  end
end

# array = [5, 3]
# bubble_sort!(array)
# p array == [3, 5]

# array = [6, 2, 7, 1, 4]
# bubble_sort!(array)
# p array == [1, 2, 4, 6, 7]

# array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
# bubble_sort!(array)
# p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

# Further Exploration: Optimization
# - The nth pass through the Array will find the nth-largest element and place it
#   into its final position. 
# eg. [6, 2, 7, 1, 4]
# Pass #1 will find the 1st largest element (7) and place it in its final
#    position [6, 2, 1, 4, 7]
# Pass #2 will find the 2nd largest element (6) and place it in its final position
#   [2, 1, 4, 6, 7]
# etc...

# Which means, on each pass, we only have to consider a subsection of the array.
# - On the first pass, consider all elements.
# - On the second pass, consider all elements, minus the last
# - On the third pass, consider all elements, minus the last 2
# etc...

# Optimization Take 2?
# After every pass, the elements after the last swap are sorted - do not need to be
# checked again.
# eg. [2, 6, 1, 4, 7]
# Pass 1 => [2, 1, 4, 6, 7]
# - The last swap is 4 <-> 6, at index 2-3.
# - Therefore, on the next pass, we only have to consider the elements up to index 2.

# [2, 1, 4]
# Pass 2 => [1, 2, 4]
# - The last swap is 1 <-> 2, at index 0-1; on the next pass, we only have to consider
#   the elements up to index 0

# [1]
# If the subarray we are considering only contains a single element, the array is
# fully-sorted.



# Optimized Algorithm:
# Given an array of elements, array:
# Create a new variable to track the end index of the array; 
#   endpoint = array size - 1
# Initialize a loop to pass through the array multiple times. For each iteration:
#   Loop through the array's elements; for each element:
#     Compare the current element to the next element; 
#     If current element is larger, swap the 2 elements
#     - Update endpoint to the current index.
#   Break when current index equals (? exceeds ?) endpoint.
# Break when we go through an entire pass without swapping anything


# [2, 6, 1, 4, 7] - endpoint = 5
# [2, 1, 6, 4, 7] -> Last swap occurs at index 2, swapping to index 3
#   -> [2, 1, 4, 6, 7]
# endpoint should be updated to 2. -> [2, 1, 4]

def bubble_sort!(array)
  endpoint = array.size - 1
  loop do
    swap_made = false
    array.each_with_index do |element, index|
      break if index == endpoint

      comparison = element <=> array[index + 1]
      if comparison == 1
        array[index], array[index + 1] = array[index + 1], array[index]
        endpoint = index
        swap_made = true
      end
    end
    break unless swap_made
  end
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = [1, 2, 3]
bubble_sort!(array)
p array == [1, 2, 3]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)