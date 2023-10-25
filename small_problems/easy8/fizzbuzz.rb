# Fizzbuzz
# Write a method that takes two arguments: the starting number and the ending 
#   number. The method should print out all numbers between the starting number
#   and ending number (inclusive).
#   - If the number is divisible by 3, print 'Fizz'; if it's divisible by 5, 
#     print 'Buzz', if it's divisible by both 3 and 5, print 'FizzBuzz'

# Input: 
#   Two Integers representing the starting and ending numbers
# Output:
#   Printing all numbers from start to end except for numbers divisible by 
#   3, 5, or both (print Fizz, Buzz, or FizzBuzz, respectively.)

# Example:
# fizzbuzz(1, 15) 
# -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

# Data: 
#   Might create a range from starting_int..ending_int

# Algorithm:
# Given two integers as input, start_int and end_int:
# Initialize a loop; counter = start_int. For each loop:
#   If the current value of counter is divisible by 15, print 'FizzBuzz'
#   Otherwise if it's divisible by 3, print 'Fizz'
#   Otherwise if it's divisible by 5, print 'Buzz'
#   Otherwise print counter
#  Increment counter
#  Exit loop if counter == end_int

def fizzbuzz(start_int, end_int)
  start_int.upto(end_int) do |int|
    output = if (int % 15).zero?
               'FizzBuzz'
             elsif (int % 3).zero?
               'Fizz'
             elsif (int % 5).zero?
               'Buzz'
             else
               int
             end
    puts output
  end
end

# Refactor

# Loop from start to end int. For each int:
#   Initialize a new empty string, output = ''
#   If int is divisible by 3, append 'Fizz' to output
#   If int is divisible by 5, append 'Buzz' to output
#   If output is empty, append current int to output (convert)
#   Print output

def fizzbuzz(start_int, end_int)
  (start_int..end_int).each do |int|
    output = ''
    output << 'Fizz' if (int % 3).zero?
    output << 'Buzz' if (int % 5).zero?
    output = int.to_s if output.empty?
    puts output
  end
end

fizzbuzz(1, 15) 
# -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz