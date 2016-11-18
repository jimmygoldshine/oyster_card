require './lib/journeylog.rb'

describe JourneyLog do

let(:journey_class) { double(:journey_class) }
let(:journeylog) { described_class.new(journey_class) }
let(:journey) { double(:journey) }

before do
  allow(journey_class).to receive(:new).and_return(journey)
end

  context "initializing" do

    it "should initialize a Journey Log to accept a journey object" do
      expect((journeylog).journey).to eq(journey)
    end
  end

  #
  # it "should respond to start method" do
  #   expect(journeylog)

end
