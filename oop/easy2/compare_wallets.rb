# Modify the code so it works. Do not make the wallet's @amount accessible from 
#   outside the class.

class Wallet
  include Comparable

  def initialize(amount)
    @amount = amount
  end

  def <=>(other_wallet)
    amount <=> other_wallet.amount
  end

  protected

  attr_reader :amount
end

bills_wallet = Wallet.new(500)
pennys_wallet = Wallet.new(465)
if bills_wallet > pennys_wallet
  puts 'Bill has more money than Penny'
elsif bills_wallet < pennys_wallet
  puts 'Penny has more money than Bill'
else
  puts 'Bill and Penny have the same amount of money.'
end

# Further Exploration
# Protected methods seem to be the most useful in cases where we need to compare
#   an attribute of two instances of the same class, without allowing the public
#   to access those attribute values.