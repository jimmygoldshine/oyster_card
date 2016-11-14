class Card

  attr_reader :balance

  DEFAULT_BALANCE = 0

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
  end

  def top_up(amount)
    @balance += amount 
    "Top up successful"
  end

end
