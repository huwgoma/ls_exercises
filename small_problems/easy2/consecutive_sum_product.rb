# Sum or Product of Consecutive Integers

# Input (From User): Integer (greater than 0)
#                    String ('s' or 'p') representing the operation
# Output: Integer - The sum or product, depending on operator input

# eg. 
# >> Please enter an integer greater than 0:
# 5
# >> Enter 's' to compute the sum, 'p' to compute the product.
# s
# The sum of the integers between 1 and 5 is 15.


# >> Please enter an integer greater than 0:
# 6
# >> Enter 's' to compute the sum, 'p' to compute the product.
# p
# The product of the integers between 1 and 6 is 720.

# Algorithm:
#   Prompt the user for a positive integer, greater than 0.
#     Convert the user's input to an integer (int)
#   Prompt the user for an operator ('s' for sum, 'p' for product) (op)
#     Convert the user's input to the corresponding symbol :+ or :*

#   Starting value has to be different (1 for product, 0 for sum) (start)
#   Iterate from 1 up to int (i = 1). For each iteration:
#     start = start +/* i 
#   Return start

OPERATIONS = {
  s: { operator: :+, start: 0 },
  p: { operator: :*, start: 1 }
}

def prompt_integer
  puts 'Please enter an Integer greater than 0:'
  gets.to_i
end

def prompt_operator
  puts "Please enter 's' (sum) or 'p' (product):"
  gets.chomp.downcase.to_sym
end

def convert_operator(input)
  OPERATIONS[input][:operator]
end

def start_int(input)
  OPERATIONS[input][:start]
end

int = prompt_integer
op_input = prompt_operator
operator = convert_operator(op_input)

#start = start_int(op_input)

# 1.upto(int) do |i|
#   start = start.send(operator, i)
# end
# puts start

puts (1..int).reduce(operator)





# reduce solution:
#   Iterate over range and call reduce with the corresponding operator