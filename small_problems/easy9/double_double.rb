# Double Doubles
# A double number is a number with an even number of digits, where the left-side
#   digits are exactly the same as the right-side digits. 
#   eg. 44, 3333, 103103, 7676 => double
#   444, 334433, 107 => not double

# Write a method that returns 2 times the number given as input, unless the 
#   input is a double number.
#   If the input is a double number, return it as-is.

# Input: Integer
# Output: An integer;
#   If the input integer is a 'double' number, return that same int,
#   otherwise, return the input integer x2

# Examples:
# twice(37) == 74
# twice(44) == 44
# twice(334433) == 668866
# twice(444) == 888
# twice(107) == 214
# twice(103103) == 103103
# twice(3333) == 3333
# twice(7676) == 7676
# twice(123_456_789_123_456_789) == 123_456_789_123_456_789
# twice(5) == 10

# Data: 
#   The integer given as input
#   - Probably will need to split the integer into an array of its digits

# Algorithm:
# Given an integer as input, int:
# Determine whether int is a double number.
#   - Split up int into an array of its digits (eg. 37) => [3, 7]
#   - Return false if digits size is odd
#   - Find the halfway point of digits. (size / 2 - 1) is the last digit of
#     the first half.
#   - Divide the digits array into two subarrays (first and second halves)
#   - If the first and second halves are equal, int is double (true)
# If int is double:
#   Return int
# Otherwise,
#   Return int * 2

def twice(int)
  double?(int) ? int : int * 2
end

def double?(int)
  digits = int.digits.reverse

  first_half, second_half = digits.partition.with_index do |int, index|
    index < digits.size / 2 
  end
  first_half == second_half
end


p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10