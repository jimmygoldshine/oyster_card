require 'station.rb'

describe Station do

  let(:station) {described_class.new("Kings Cross", 1)}

  it "should expose the zone of a station" do
    expect(station.zone).to eq 1
  end

  it "should expose the name of a station" do
    expect(station.name).to eq "Kings Cross"
  end

end
