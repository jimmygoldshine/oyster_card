class JourneyLog

  attr_reader :journey

  def initialize(journey_class)
    @journey = journey_class.new
  end

end
