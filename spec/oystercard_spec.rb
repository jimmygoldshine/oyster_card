require './lib/oystercard'

describe Oystercard do
  it "checks a new card has a default balance of zero" do
    expect(subject.balance).to eq 0
  end

  it "checks that top_up method can be passed one argument" do
    expect(subject).to respond_to(:top_up).with(1).argument
  end
  
end
