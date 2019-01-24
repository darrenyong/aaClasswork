require "deck"

RSpec.describe do
    describe "#initialize" do
        let (:poker_deck) { Deck.new }
        let (:hearts) { poker_deck.deck.select {|ele| ele.suit == :heart} }
        let (:clubs) { poker_deck.deck.select {|ele| ele.suit == :club} }
        let (:diamonds) { poker_deck.deck.select {|ele| ele.suit == :diamond} }
        let (:spades) { poker_deck.deck.select {|ele| ele.suit == :spade} }

        it "initialize with an array with length of 52" do
            expect(poker_deck.deck.length).to eq(52)
        end

        it "creates 4 suits with length of 13 for each" do
             expect(hearts.length).to eq(13)
             expect(clubs.length).to eq(13)
             expect(diamonds.length).to eq(13)
             expect(spades.length).to eq(13)
        end
    end
end