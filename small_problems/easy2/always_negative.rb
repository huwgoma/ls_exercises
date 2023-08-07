# Always Negative

# Input: Integer
# Output: Integer, but negative
#   If the argument is positive, return the negative form of that number
#   Otherwise, just return the number as is.

# eg.
# negative(5) == -5
# negative(-3) == -3
# negative(0) == 0      # There's no such thing as -0 in ruby

# Alg:
#   Given an Integer input int
#   If the number is less than or equal to 0, return the number.
#   Otherwise, return the number, but negative.

def negative(int)
  int <= 0 ? int : -int
end

# def negative(int)
#   -(int.abs)
# end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      # There's no such thing as -0 in ruby