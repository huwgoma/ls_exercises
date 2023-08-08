# Arithmetic Integer

# Input (From user): 2 positive integers.
#   The second input may not be 0.

# Output: Print results of + - * / % ** operations 

# eg.
# ==> Enter the first number:
# 23
# ==> Enter the second number:
# 17
# ==> 23 + 17 = 40
# ==> 23 - 17 = 6
# ==> 23 * 17 = 391
# ==> 23 / 17 = 1
# ==> 23 % 17 = 6
# ==> 23 ** 17 = 141050039560662968926103

# Alg:
#   Initialize a constant - OPERATORS, an array of symbols (the 6 operators)
#   Initialize an empty array [] numbers
#   Loop twice. (i=0). For each loop:
#     Prompt the user to enter number i + 1
#     Convert the input to an integer and save it to numbers
#   Iterate over OPERATORS array. For each operator symbol:
#     Operate on the two numbers, using the current operator symbol.  
#     Print the operation and the output.

OPERATORS = [:+, :-, :*, :/, :%, :**]

numbers = []
2.times do |i| 
  puts "Enter number ##{i + 1}:"
  numbers << gets.to_i
end

OPERATORS.each do |operator|
  result = numbers.reduce(operator)
  puts "#{numbers.first} #{operator} #{numbers[1]} = #{result}" 
end
