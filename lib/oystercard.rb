require_relative 'station'
require_relative 'journey'

class Oystercard

attr_reader :balance, :history

DEFAULT_OYSTER_MAX_BALANCE = 90
MINIMUM_FARE = 1
PENALTY_FARE = 6

  def initialize
    @balance = 0
    @history = []
    @journey
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
    deduct(PENALTY_FARE) if invalid_entry?
    raise "Error: Not enough money on card for journey" if balance_is_under_minimum_fare?
    @journey = Journey.new(entry_station)
    @journey.entry_station
  end

  def touch_out(exit_station)


    invalid_exit? ? deduct(PENALTY_FARE) : deduct(MINIMUM_FARE)
    @journey.add_exit_station(exit_station)
    @history << @journey.add_journey
  end

  # def fare
  #   return MINIMUM_FARE if @journey.in_journey?
  #   6
  # end

  def invalid_exit?
    !@journey.in_journey?
  end

  def invalid_entry?
    if @journey.nil?
      false
    else
      @journey.in_journey?
    end



  end

  private

  def deduct(fare)
    @balance -= fare
  end







end
