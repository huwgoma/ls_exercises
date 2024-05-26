require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'transaction'

# Simulating/Mocking user input (to avoid providing the same inputs over and over)
# StringIO - string stream that contains simulated keyboard inputs
# eg. 

# Equivalent to typing 30, Enter (\n), 60, Enter (\n)
# input = StringIO.new("30\n60\n")
# p input.gets.chomp #=> "30"
# p input.gets.chomp #=> "60"

# 1) Modify the method to take an optional input parameter (default $stdin)
# 2) Create a StringIO object, which takes a string on instantiation representing
#     the inputs to be mocked.
# 3) StringIO#gets returns a line from its string (stopping at \n (enter))
# 4) In the test, we can pass the StringIO object as input; when #gets is called on `input`, 
#    StringIO#gets will be called, and will return the first line of its input stream as a string.


class TransactionTest < Minitest::Test
  def setup
    @transaction = Transaction.new(100) # $100 item
  end

  def test_prompt_for_payment
    input = StringIO.new("120\n")
    output = StringIO.new
    @transaction.prompt_for_payment(input: input, output: output)

    assert_equal(120.0, @transaction.amount_paid) 
  end
end
