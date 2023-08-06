# Odd

# Input: Integer (Positive, negative, or 0)
# Output: True if the input's absolute value is odd.
# Rules:
  # Assume the argument is a valid integer.
  # Do not use #odd? or #even?

# eg.
# puts is_odd?(2)    # => false
# puts is_odd?(5)    # => true
# puts is_odd?(-17)  # => true
# puts is_odd?(-8)   # => false
# puts is_odd?(0)    # => false
# puts is_odd?(7)    # => true

# Alg:
#   Given an Integer argument, int:
#   Reassign int to the absolute value of int
#   Divide int by 2 and check for the remainder.
#     If the remainder is 1, int is odd => true
#     If the remainder is not 1, int is even => false

# def is_odd?(int)
#   int = int.abs
#   (int % 2).positive?
# end

# Rewrite using #remainder
def is_odd?(int)
  int.abs.remainder(2) == 1
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true