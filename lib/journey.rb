class Journey

  attr_reader :entry_station, :exit_station

  def initialize(entry_station)
    @entry_station = entry_station
    @exit_station
  end

  def add_exit_station(exit_station)
    @exit_station = exit_station
  end

  def add_journey
    {:entry_station => entry_station, :exit_station => exit_station}
  end

  def in_journey?
    !!entry_station && !exit_station
  end


end
