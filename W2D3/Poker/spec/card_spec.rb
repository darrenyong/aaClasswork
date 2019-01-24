require "card"

RSpec.describe do
    describe "#initialize" do
        let(:card) { Card.new(13, "suit") }
        it "Initializes with the value and suit passed to it" do
            expect(card.value).to eq(13)
            expect(card.suit).to eq("suit")
        end

        it "raises an error if the value is invalid" do
            expect{Card.new(34, 'suit')}.to raise_error(InvalidBounds)
        end
    end


end