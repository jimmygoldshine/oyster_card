require './lib/oystercard'

describe Oystercard do

  let(:card) {described_class.new}

  it "checks a new card has a default balance of zero" do
    expect(card.balance).to eq 0
  end

  it "checks that top_up method can be passed one argument" do
    expect(card).to respond_to(:top_up).with(1).argument
  end

  it "allows the balance of the card to increase by the top up value" do
    card.top_up(5)
    expect(card.balance).to eq 5
  end

  it "stops the card being topped up over a maximum value of £90" do
    expect { (card.top_up(95)) }.to raise_error "Error: top up failed, maximum value cannot exceed #{card.class::DEFAULT_OYSTER_MAX_BALANCE}"
  end

  # it "checks whether the card is part way through a journey" do
  #   expect(card.in_journey?).to eq true
  # end

  context "Not enough money on Oystercard" do

    it "raises an error when touch in without enough money" do
      expect{card.touch_in}.to raise_error("Error: Not enough money on card for journey")
    end
  end

  context "Enough money on Oystercard for journey" do

    before do
      card.top_up(1)
    end

    it "checks if the card is in use" do
      card.touch_in
      expect(card.in_use).to eq true
    end

    it "checks if the card has stopped being in use" do
      card.touch_in
      card.touch_out
      expect(card.in_journey?).to eq false
    end

    it "confirms that the card has been touched in" do
      expect(card.touch_in).to eq true
    end


    describe "Touching out " do

      it "touching out reduces the balance by the minimum fare" do
        card.touch_in
        expect{card.touch_out}.to change{card.balance}.by -Oystercard::MINIMUM_FARE
      end

    end


  end

end
