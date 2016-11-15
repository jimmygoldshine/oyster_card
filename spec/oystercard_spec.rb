require './lib/oystercard'

describe Oystercard do
  it "checks a new card has a default balance of zero" do
    expect(subject.balance).to eq 0
  end

  it "checks that top_up method can be passed one argument" do
    expect(subject).to respond_to(:top_up).with(1).argument
  end

  it "allows the balance of the card to increase by the top up value" do
    subject.top_up(5)
    expect(subject.balance).to eq 5
  end

  it "stops the card being topped up over a maximum value of £90" do
    expect { (subject.top_up(95)) }.to raise_error "Error: top up failed, maximum value cannot exceed #{subject.class::DEFAULT_OYSTER_MAX_BALANCE}"
  end

  it "checks that deduct method can be passed one argument" do
    expect(subject).to respond_to(:deduct).with(1).argument
  end

  it "checks that it will deduct the fare from the oystercard balance" do
    expect(subject.deduct(10)).to eq -10
  end

  it "confirms that the card has been touched in" do
    expect(subject.touch_in).to eq true
  end

  it "confirms that the card has been touched out" do
    expect(subject.touch_out).to eq true
  end

  # it "checks whether the card is part way through a journey" do
  #   expect(subject.in_journey?).to eq true
  # end

  it "checks if the card is in use" do
    subject.touch_in
    expect(subject.in_use).to eq true
  end

  it "checks if the card has stopped being in use" do
    subject.touch_in
    subject.touch_out
    expect(subject.in_journey?).to eq false
  end

end
