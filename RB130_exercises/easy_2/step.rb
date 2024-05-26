# Range#step - Iterates over a range of values, where each value is the previous
#   value, plus a 'step' value. Returns the calling range.

# Write a method that does the same thing as Range#step, but does not operate 
#   on a Range. Instead, it takes 3 arguments: start value, end value, and step
#   value.
# - The method should also take a block to which it will yield iteration values.

# Input: 3 integers
# - Represent the start value, end value, and step value.
# - Step value? Amount to increment the start value by.

# Output: 
# - 
# - Return value ...?

# Examples:
# step(1, 10, 3) { |value| puts "value = #{value}" }
# - series: [1, 4, 7, 10] (10 >= 10, so exit iteration)
# - Iterate over 1, 4, 7, 10 and yield to block
# - Returns [1, 4, 7, 10] ? or (1..10)

# step(1, 11, 3) { |value| puts "value = #{value}" }
# - series: [1, 4, 7, 10] (13 > 10, do not add; exit iteration)
# - "" as above

# Algorithm:
# Given 3 integers, representing a start value, end value, and step value:
# Create a series of values to iterate over:
# - value = `start_value`
# - Increment value by `step`. 
#   - If incremented value is less than/equal to end value, add to series
#   - If incremented value is equal to/exceeds end value, exit iteration.


# Iterate through series and yield each element to the block.
# Perhaps return an array representing the series?
# - Or a range from start..end? mimicking Range#step

# def step(start_value, end_value, step_value)
#   series = create_series(start_value, end_value, step_value)
#   series.each { |int| yield(int) }
# end

# def create_series(start_value, end_value, step_value)
#   value = start_value
#   series = [start_value]

#   while value < end_value
#     increment = value += step_value
#     series << increment if increment <= end_value 
#   end

#   series
# end

# step(1, 10, 3) { |value| puts "value = #{value}" }
# step(1, 11, 3) { |value| puts "value = #{value}" }

# Same output x2 
# value = 1
# value = 4
# value = 7
# value = 10


# Alternative Algorithm:
# Given 3 integers, representing a start value, end value, and step value:
# Initialize a new variable, value = start_value
# Initialize a loop; while value is less than/equal to end_value:
#   yield the current value to the block
#   increment value by step.
# 
# (1, 5, 4) => [1, 5]

def step(head, tail, step)
  value = head
  while value <= tail
    yield(value)
    value += step
  end
  # Return value can be whatever we want it to be
end

# step(1, 10, 3) { |value| puts "value = #{value}" }
# step(1, 11, 3) { |value| puts "value = #{value}" }

step(1, 10, 10) { |value| puts "value = #{value}" }