# When & is applied to an argument object, Ruby tries to convert that object
# into a block.
# - If the object is not a Proc, & converts it into a Proc first (with #to_proc)

# When & is applied to a method parameter, the block (if given) is converted 
# into a Proc.


# & can also be applied to an object of the Method class (Object#method), which
# will call Method#to_proc.

# Fill in the missing part of this code so that it converts the array of integers
#   to base 8 octal numbers.

# Replace the two `method_name` placeholders with actual method calls
def convert_to_base_8(n)
  # n is an integer.
  n.to_s(8).to_i
end

# Replace `argument` with the correct argument below
# `method` is `Object#method`, not a placeholder
base8_proc = method(:convert_to_base_8).to_proc
# == Create a Proc that calls convert to base 8 on its argument

# We'll need a Proc object to make this code work
# Replace `a_proc` with the correct object
p [8, 10, 12, 14, 16, 33].map(&base8_proc)
# [8, 10, 12, 14, 16, 33].map { |int| int.to_s(8).to_i }
#=> [10, 12, 14, 16, 20, 41]