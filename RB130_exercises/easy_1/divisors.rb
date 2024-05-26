# Divisors
# Write a method that takes a positive integer as argument, and returns a list of
# all integer divisors of that integer.

# What is a divisor? 
# - A divisor is an integer that can divide another integer into itself cleanly.
# eg. the divisors of 12 are 1, 2, 3, 4, 6, and 12

# Input: 
# - A positive integer
# Output:
# - An array containing all divisors of the given integer
# - Can be in any order
# - Includes 1 and the integer itself.

# Examples:
# divisors(1) == [1]
# divisors(7) == [1, 7]
# divisors(12) == [1, 2, 3, 4, 6, 12]
# divisors(98) == [1, 2, 7, 14, 49, 98]
# divisors(99400891) == [1, 9967, 9973, 99400891]

# Algorithm:
# Given a positive integer as input, int:
# Iterate from 1 up to int. For each divisor:
#   - Divide int by divisor; check the remainder of the division.
#   - If remainder is 0, add the current divisor to selection.

# - Return selection

def divisors(int)
  (1..int).select do |divisor| 
    int % divisor == 0
  end
end

# p divisors(1) == [1]
# p divisors(7) == [1, 7]
# p divisors(12) == [1, 2, 3, 4, 6, 12]
# p divisors(27) == [1, 3, 9, 27]
# p divisors(98) == [1, 2, 7, 14, 49, 98]
# p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute

# Further Exploration: 
# - Right now we are brute forcing - trying every possible solution.
# - These are easy to write, but are usually slow.

# Can you make divisors(999962000357) return almost instantly?
# - The divisors are [1, 999979, 999983, 999962000357]

# Observations:
# - 2 of the divisors can be obtained instantly - 1 and the number itself.
# Ignoring 1 and int:
# - When we find a divisor, find the other number (will also be a divisor)
# - eg. 12 - Iterate starting at 1
#   - 1 - Divisor? yes => What is the other number? 12. Add 1 and 12 to array.
#   - 2 - Divisor? yes. array contains 2? no. other num? 6. Add 2 and 6 to array.
#   - 3 - Divisor? yes - array contains 3? no - other num? 4 - add 3 and 4.
#   - 4 - array contains 4? yes - stop iteration.
#   array at this point: [1, 12, 2, 6, 3, 4] => sort => [1, 2, 3, 4, 6, 12]


# Algorithm: 
# Given a positive integer as input, int:
# - Initialize a new array, divisors = [].
# - Iterate from 1 up to int. For each divisor:
#   - If divisors already contains the current divisor, return divisors array
#   - Divide int by the current divisor. If the remainder is 0, add the 
#     current divisor and the quotient to divisors.
# - Return divisors -sorted-

def time_it
  before = Time.now
  yield
  after = Time.now
  puts "Time taken: #{after - before} seconds."
end

def divisors(int)
  divisors = []
  
  (1..int).each do |divisor|
    break if divisors.include?(divisor)

    quotient, remainder = int.divmod(divisor)
    divisors.push(divisor, quotient) if remainder.zero?
  end

  divisors.uniq.sort
end


# p divisors(1) == [1]
# p divisors(2) == [1, 2]

# p divisors(7) == [1, 7]
# p divisors(12) == [1, 2, 3, 4, 6, 12]
# p divisors(27) == [1, 3, 9, 27]
# p divisors(98) == [1, 2, 7, 14, 49, 98]
# p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
# p divisors(999962000357) == [1, 999979, 999983, 999962000357]

time_it { divisors(999962000357) }