# Reverse the Digits in a Number

# Input: Integer (int); must be positive
# Output: Integer; digits are reversed
# Rules:
#   Neither the input nor output should have leading 0s 
#   eg. 012 is an octal number -> 10 
#   eg. 120 reversed is 012 -> Should return 12, not 012 (strip the 0)

# eg. 
# reversed_number(12345) == 54321
# reversed_number(12213) == 31221
# reversed_number(456) == 654
# reversed_number(12000) == 21 # No leading zeros in return value!
# reversed_number(12003) == 30021
# reversed_number(1) == 1

# Alg:
#   Given an Integer, int:
#   Convert the Integer to a string.
#   Reverse the string.
#   Convert the string back to an Integer.
#     Leading 0s are automatically stripped here.
#   Return the Integer

def reversed_number(int)
  int.to_s.reverse.to_i
end

# def reversed_number(int)
#   int.digits.join.to_i
# end

puts reversed_number(12345) == 54321
puts reversed_number(12213) == 31221
puts reversed_number(456) == 654
puts reversed_number(12000) == 21 # No leading zeros in return value!
puts reversed_number(12003) == 30021
puts reversed_number(1) == 1