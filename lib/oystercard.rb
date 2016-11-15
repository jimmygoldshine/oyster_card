class Oystercard

attr_reader :balance

DEFAULT_OYSTER_MAX_BALANCE = 90

  def initialize
    @balance = 0
  end

  def top_up(value)
    raise "Error: top up failed, maximum value cannot exceed #{DEFAULT_OYSTER_MAX_BALANCE}" if @balance + value > DEFAULT_OYSTER_MAX_BALANCE
    @balance += value
  end

  def deduct(value)
    @balance -= value
  end

end
