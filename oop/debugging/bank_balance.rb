# Bank Balance
# We have a BankAccount class with overdraft protection (ie. does not allow
# withdrawal amount greater than the current balance)

# When we test this code, we get some unexpected behavior.
# class BankAccount
#   attr_reader :balance

#   def initialize(account_number, client)
#     @account_number = account_number
#     @client = client
#     @balance = 0
#   end

#   def deposit(amount)
#     if amount > 0
#       self.balance += amount
#       "$#{amount} deposited. Total balance is $#{balance}."
#     else
#       "Invalid. Enter a positive amount."
#     end
#   end

#   def withdraw(amount)
#     if amount > 0
#       success = (self.balance -= amount)
#     else
#       success = false
#     end

#     if success
#       "$#{amount} withdrawn. Total balance is $#{balance}."
#     else
#       "Invalid. Enter positive amount less than or equal to current balance ($#{balance})."
#     end
#   end

#   def balance=(new_balance)
#     if valid_transaction?(new_balance)
#       @balance = new_balance
#       true
#     else
#       false
#     end
#   end

#   def valid_transaction?(new_balance)
#     new_balance >= 0
#   end
# end

# Example

# account = BankAccount.new('5538898', 'Genevieve')

#                           # Expected output:
# p account.balance         # => 0
# p account.deposit(50)     # => $50 deposited. Total balance is $50.
# p account.balance         # => 50
# p account.withdraw(80)    # => Invalid. Enter positive amount less than or equal to current balance ($50).
#                           # Actual output: $80 withdrawn. Total balance is $50.
# p account.balance         # => 50

# The Unexpected Behavior: 
# When we try to withdraw $80 from $50, the transaction is properly blocked; however,
#   we see some unexpected output, telling us that $80 was withdrawn, but that
#   the total balance is $50.

# Source of Error:
# In Ruby, setter methods (value=(new_value)) *always* return the
#   argument that was passed in. In our `balance=` method, we attempt to return
#   a boolean based on whether the new balance is valid; however, the value of
#   `new_balance` will ALWAYS be returned, regardless of its validity.
# In the `#withdraw` method, the local variable `success` is assigned to the return
#   value of the `balance=` setter (intended to be true or false). In reality,
#   `success` will always be assigned to the result of `balance - amount`, meaning
#   that its value will always be truthy - hence why the string under the `if
#   success` conditional is returned and printed.

# To Fix:
# When #withdraw is called with an amount, we can immediately check if the
#   transaction is valid, passing in a value obtained from subtracting `amount` 
#   from `balance`.
# If the transaction is valid, reassign `@balance` and print the corresponding string.
# Otherwise, simply print the error message.
# eg.
class BankAccount
  attr_reader :balance

  def initialize(account_number, client)
    @account_number = account_number
    @client = client
    @balance = 0
  end

  def deposit(amount)
    if amount > 0
      self.balance += amount
      "$#{amount} deposited. Total balance is $#{balance}."
    else
      "Invalid. Enter a positive amount."
    end
  end

  def withdraw(amount)
    if amount > 0 && valid_transaction?(balance - amount)
      self.balance -= amount
      "$#{amount} withdrawn. Total balance is $#{balance}."
    else
      "Invalid. Enter positive amount less than or equal to current balance ($#{balance})."
    end
  end

  def balance=(new_balance)
    @balance = new_balance
  end

  def valid_transaction?(new_balance)
    new_balance >= 0
  end
end

# Example

account = BankAccount.new('5538898', 'Genevieve')

                          # Expected output:
p account.balance         # => 0
p account.deposit(50)     # => $50 deposited. Total balance is $50.
p account.balance         # => 50
p account.withdraw(80)    # => Invalid. Enter positive amount less than or equal to current balance ($50).

p account.balance         # => 50


# Further Exploration: 
# What will the return value of a setter method be if its argument is mutated?
# 
# Setter methods unconditionally return the argument that was given. Thus, 
#   if the argument is mutated, the return value of the setter method will
#   reflect that mutation.