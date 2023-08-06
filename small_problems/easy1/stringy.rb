# Stringy

# Input: Integer (Must be positive)
#   Assume input is a valid positive integer.

# Output: String
#   String contains alternating 1 and 0, starts with 1.

# eg. 
# puts stringy(6) == '101010'
# puts stringy(9) == '101010101'
# puts stringy(4) == '1010'
# puts stringy(7) == '1010101'

# Alg:
#   Given an input Integer, int
#   Initialize an empty string, str = ''
#   Loop int times (i = 0). For each loop:
#     if i is even, concatenate '1' to str
#     if i is odd, concatenate '0' to str
#   Return str

# def stringy(int)
#   str = ''
#   int.times do |i|
#     chr = i.even? ? '1' : '0'
#     str << chr
#   end
#   str
# end

# Further Exploration: 
# Modify stringy with an additional default parameter (=1)
# If this is set to 0, the returned string should start with 0 instead.

# Alg: 
#   Given an Integer, int; and another Integer, start (0/1)
#   Initialize a new string, str, with the value of start (either 1 or 0) 
#     str = start.to_s
#   Loop (int - 1) times (i = 0). For each loop:
#     if the last character in str is 1, append 0.
#     if the last character in str is 0, append 1.
#   Return str

def stringy(int, start=1)
  str = start.to_s
  (int - 1).times do 
    chr = str[-1].to_i.zero? ? '1' : '0'
    str << chr
  end
  str
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

puts stringy(6, 0) == '010101'
puts stringy(9, 0) == '010101010'
puts stringy(4, 0) == '0101'
puts stringy(7, 0) == '0101010'