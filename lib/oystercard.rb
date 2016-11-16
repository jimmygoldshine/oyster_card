class Oystercard

attr_reader :balance, :in_use, :entry_station, :journey_history, :exit_station

DEFAULT_OYSTER_MAX_BALANCE = 90
MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @in_use = false
    @entry_station
    @exit_station
    @journey_history = []
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

  def touch_in(entry_station)
    raise "Error: Not enough money on card for journey" if balance_is_under_minimum_fare?
    @entry_station = entry_station
    @in_use = true
  end

  def touch_out(exit_station)
    deduct(MINIMUM_FARE)
    @exit_station = exit_station
    add_journey
    @entry_station = nil
    @in_use = false
  end

  def add_journey
    @journey_history << {:entry_station => entry_station, :exit_station => exit_station}
  end

  def in_journey?
    !!@entry_station
  end

  private

  def deduct(fare)
    @balance -= fare
  end



end
