# Exclusive OR

# Input: Two arguments (anything)
# Output: true (Boolean) if exactly one of the arguments is truthy.
#         false otherwise.

# eg.
# xor?(5.even?, 4.even?) == true
# xor?(5.odd?, 4.odd?) == true
# xor?(5.odd?, 4.even?) == false
# xor?(5.even?, 4.odd?) == false

# Alg:
#   Given two arguments, arg1 and arg2
#   Convert both arguments to their Boolean values using !!
#   Check that arg1 is not equal to arg2 after conversion.
#     ie. if !!arg1 -> true, !!arg2 must be false and vice versa.

def xor?(arg1, arg2)
  (!!arg1) != (!!arg2)
end

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false