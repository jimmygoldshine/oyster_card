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

end
