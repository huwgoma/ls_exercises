# Repeat Yourself

# Input: String and positive Integer.
  # Assume inputs are valid.
# Output: Print the string Integer # of times.

# eg. repeat('Hello', 3)
#     -> Hello
#     -> Hello
#     -> Hello

# Alg:
#   Given a String (str) and positive Integer (int)
#   Loop int times. For each loop:
#     Print str to output 
#   End loop

def repeat(str, int)
  int.times { puts str }
end

# def repeat(str, int)
#   i = 0
#   loop do
#     puts str
#     i += 1
#     break if i >= int 
#   end
# end

# def repeat(str, int)
#   until int == 0
#     puts str
#     int -= 1
#   end
# end

repeat('Hello', 3)