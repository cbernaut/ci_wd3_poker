require File.join(File.dirname(__FILE__), '..',File.basename(__FILE__.gsub('_spec','')))
require File.join(File.dirname(__FILE__), '..',File.basename('deck.rb'))

describe FiveCardStud do
  let(:obj){ described_class.new }

  describe "Constants" do
    describe "CARDS_PER_HAND" do
      it "should be an Integer" do
        expect(FiveCardStud::CARDS_PER_HAND).to be_a(Integer)
      end

      it "should equal five" do
        expect(FiveCardStud::CARDS_PER_HAND).to eq(5)
      end
    end
  end #Constants

  describe "Attributes" do

    it ":hands should exist" do
      expect(obj).to have_attributes(hands: nil)
    end
  end #Attributes

  describe "Methods" do
    describe ':: Class' do
      describe '::rank([[...], [...], ...])' do
        let(:high_card){ ['queen of hearts', 'king of spades', '3 of diamonds', '6 of clubs', 'jack of clubs'] }
        let(:one_pair){ ['2 of spades','2 of clubs', 'jack of diamonds', '7 of hearts', '9 of spades'] }
        let(:full_house){ ['2 of hearts','2 of diamonds', '7 of diamonds', '7 of spades', '7 of clubs'] }

        let(:hands){ [high_card, one_pair, full_house] }
        let(:ranking){ described_class.rank(hands) }

        it 'should return an Array of Arrays of hands' do
          expect(ranking).to be_an(Array)
          expect(ranking.first).to be_an(Array)
        end
        it 'should order the hands from highest to lowest' do
          expect(ranking[0]).to eq(full_house)
          expect(ranking[2]).to eq(one_pair)
          expect(ranking[1]).to eq(high_card)
        end
      end
    end #Instance
  end #Methods
=begin
  def hands(number: 2)
    these_hands = []
    deck = Deck.shuffle
    number.times do
      these_hands << deck.pop(described_class::CARDS_PER_HAND)
    end
    these_hands
  end
=end
end