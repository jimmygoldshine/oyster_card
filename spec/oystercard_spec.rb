require './lib/oystercard'

describe Oystercard do

  let(:card) {described_class.new}
  let(:entry_station) {double :entry_station}
  let(:exit_station) {double :exit_station}

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
      expect{card.touch_in(entry_station)}.to raise_error("Error: Not enough money on card for journey")
    end
  end

  context "Enough money on Oystercard for journey" do

    before do
      card.top_up(10)
    end

    it "confirms that the card has been touched in" do
      expect(card.touch_in(entry_station)).to eq entry_station
    end


    describe "Touching out " do

      it "touching out reduces the balance by the minimum fare" do
        card.touch_in(entry_station)
        expect{card.touch_out(exit_station)}.to change{card.balance}.by -Oystercard::MINIMUM_FARE
      end

      it "touch_out accepts a station as an argument" do
        expect(card).to respond_to(:touch_out).with(1).argument
      end

    end

    context "Touching in" do

          it "touch_in accepts a station as an argument" do
            expect(card).to respond_to(:touch_in).with(1).argument
          end


      describe "Charging a fare if journey was not completed"  do

        before do
          card.touch_in(entry_station)
          card.touch_out(exit_station)
        end


        it "touching in when in_journey is true charges a penalty fare" do
          card.touch_in(entry_station)
          expect{card.touch_in(entry_station)}.to change{card.balance}.by(-Oystercard::PENALTY_FARE)
        end

        it "touching out when in_journey is true charges the minimum fare" do
          card.touch_in(entry_station)
          expect{card.touch_out(exit_station)}.to change{card.balance}.by(-Oystercard::MINIMUM_FARE)
        end

        it "touching out when in_journey is false charges a penalty fare" do
          expect{card.touch_out(exit_station)}.to change{card.balance}.by(-Oystercard::PENALTY_FARE )
        end

    end


    describe "Journey history" do
      it "The journey history is empty by default" do
        expect(card.history).to eq []
      end
    end

  end




  end



end
