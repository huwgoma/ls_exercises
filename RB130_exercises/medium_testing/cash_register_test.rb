require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative "cash_register"
require_relative "transaction"

class CashRegisterTest < Minitest::Test
  def setup
    @register = CashRegister.new(1000)
    @transaction = Transaction.new(100) # $100 item cost
  end

  def test_accept_money
    @transaction.amount_paid = 100
    balance_before = @register.total_money

    @register.accept_money(@transaction)
    assert_equal(balance_before + 100, @register.total_money)
  end

  def test_change
    @transaction.amount_paid = 120
    change = 120 - @transaction.item_cost
    
    assert_equal(change, @register.change(@transaction))
  end

  def test_give_receipt
    receipt = "You've paid $100.\n"
    assert_output(receipt) { @register.give_receipt(@transaction) } 
  end
end
