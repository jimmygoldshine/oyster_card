class Oystercard

attr_reader :balance, :in_use

DEFAULT_OYSTER_MAX_BALANCE = 90

  def initialize
    @balance = 0
    @in_use = false
  end

  def top_up(value)
    raise "Error: top up failed, maximum value cannot exceed #{DEFAULT_OYSTER_MAX_BALANCE}" if @balance + value > DEFAULT_OYSTER_MAX_BALANCE
    @balance += value
  end

  def deduct(value)
    @balance -= value
  end

  def touch_in
    @in_use = true
  end

  def touch_out
    true
  end

  def in_journey?
    touch_in && !touch_out
  end

end
