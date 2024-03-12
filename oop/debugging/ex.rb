class Bank
  def initialize(balance)
    @balance = balance
  end

  def balance
    @balance
  end

  def balance=(new_balance)
    @balance = new_balance.upcase!
  end
end

b = Bank.new('a')
puts b.balance #=> 'a
p b.balance = 'b'
puts b.balance #=> 'b' 
