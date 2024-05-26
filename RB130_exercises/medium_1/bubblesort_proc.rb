# Bubblesort Refactor, using a Proc.

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

# Rationale: Instead of checking each time we iterate whether a block is given,
#   we should check once at the start; if a block is given, create a proc from
#   the given block; otherwise, create a proc that takes two arguments and 
#   checks whether the first element is <= the second element.

# Algorithm:
# Given an array and an optional block as input:
# Determine the sorting criteria.
# - If a block is given, convert it into a proc via (&block) parameter.
# - If no block is given, instantiate a new Proc and assign it to block.
#   - Proc.new { |first, second| first <= second }
# Initialize a loop to determine when the array is fully sorted.
# - Initialize new variable, swap made = false.
# - Iterate through the array, excluding the last element. For each element:
#   - Retrieve the element at the next index.
#   * Call the proc, passing the current and next elements into the proc.
#     - If the proc returns true, skip the rest of the current iteration.
#     - Otherwise, swap the current and next elements, and set swap made = true.
# - EOI => Break the outer loop unless a swap was made.
# => Return array.

def bubble_sort!(array, &block)
  block ||= Proc.new { |first, second| first <= second }

  loop do
    swap_made = false

    array[0..-2].each_with_index do |element, index|
      next_element = array[index + 1]
      next if block.call(element, next_element)

      array[index], array[index + 1] = array[index + 1], array[index]
      swap_made = true
    end
    break unless swap_made
  end
  array
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [5, 3, 7]
bubble_sort!(array) { |first, second| first >= second }
p array == [7, 5, 3]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = [6, 12, 27, 22, 14]
bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
p array == [14, 22, 12, 6, 27]

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array)
p array == %w(Kim Pete Tyler alice bonnie rachel sue)

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
p array == %w(alice bonnie Kim Pete rachel sue Tyler)

# Same refactor, but for sort_by! ==================

def bubble_sort_by!(array, &block)
  block ||= Proc.new { |element| element }

  loop do
    swap_made = false

    array[0..-2].each_with_index do |element, index|
      next_element = array[index + 1]
      next if block.call(element) <= block.call(next_element)

      array[index], array[index + 1] = array[index + 1], array[index]
      swap_made = true
    end
    break unless swap_made
  end
  array
end

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort_by!(array) { |value| value.downcase }
p array == %w(alice bonnie Kim Pete rachel sue Tyler)