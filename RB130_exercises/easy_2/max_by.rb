# max_by - Iterates over the calling collection, passes each element to the given
# block, and returns the element for which the block returned the 'largest' value.

# Permitted:
# #each, #each_with_object, #each_with_index, #reduce, loop, for, while, or until

# Input:
# - An array and a block
# Output:
# - The element from the array for which the block returned the largest value.
# - nil if array is empty

# Examples:
# max_by([1, 5, 3]) { |value| value + 2 } == 5
# max_by([1, 5, 3]) { |value| 9 - value } == 1
# max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
# max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
# max_by([-7]) { |value| value * 3 } == -7
# max_by([]) { |value| value + 5 } == nil

# Algorithm:
# Given an array and block as input: 
# Initialize a new variable, max_element = array.first
#                            max_return = yield first element to block

# Iterate through the remaining array elements. For each element:
# - yield the current element to the block.
# - If the block's return value is greater than max_return, assign max_return to
#   block return value, then update max_element to current element
# EOI => Return max_element


# def max_by(array, &block)
#   max_element = nil
#   max_return = nil

#   array.each do |element|
#     value = block.call(element)
#     if max_return.nil? || value > max_return
#       max_return = value
#       max_element = element
#     end
#   end
#   max_element
# end

# def max_by(array, &block)
#   return nil if array.empty?

#   max_element = array.first
#   max_return = block.call(max_element)

#   array[1..-1].each do |element|
#     value = block.call(element)
#     if value > max_return
#       max_return = value
#       max_element = element
#     end
#   end
#   max_element
# end



p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil


# =====================================
# Given an array and block as input:
# Take the first element and the first block return value
# max_by([1, 5, 3]) { |value| value + 2 } == 5
# - eg. element = 1, value = 3 