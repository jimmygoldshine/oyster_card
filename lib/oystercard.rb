class Oystercard

attr_reader :balance, :in_use

DEFAULT_OYSTER_MAX_BALANCE = 90
MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @in_use = false
  end

  def top_up(value)
    raise "Error: top up failed, maximum value cannot exceed #{DEFAULT_OYSTER_MAX_BALANCE}" if balance_will_be_over_maximum(value)
    @balance += value
  end

  def balance_will_be_over_maximum(value)
    @balance + value > DEFAULT_OYSTER_MAX_BALANCE
  end

  def balance_is_under_minimum_fare?
    @balance < MINIMUM_FARE
  end

  def touch_in
    raise "Error: Not enough money on card for journey" if balance_is_under_minimum_fare?
    @in_use = true
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @in_use = false
  end

  def in_journey?
    @in_use
  end

  private

  def deduct(fare)
    @balance -= fare
  end



end
