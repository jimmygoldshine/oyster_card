require 'journey'

describe Journey do

  let (:journey) {described_class.new(entry_station)}
  let (:entry_station) {double :entry_station}
  let (:exit_station) {double :exit_station}

  describe "Journey history" do

    it "touching in and touching out creates a journey hash" do
      journey.add_exit_station(exit_station)
      expect(journey.add_journey).to eq({:entry_station => entry_station, :exit_station => exit_station})
    end



  end

  describe "adding exit station" do

    it "adding exit station to the journey" do
      journey.add_exit_station(exit_station)
      expect(journey.exit_station).to eq exit_station
    end
  end

  describe "Confirming journey" do
    it "in_journey is not true if no entry station is set" do
      allow(journey).to receive(:entry_station).and_return nil
      expect(journey.in_journey?).to eq false
    end

    it "in_journey is true if an entry station is set" do
      allow(journey).to receive(:entry_station).and_return "Kings Cross"
      expect(journey.in_journey?).to eq true
    end
  end

end
