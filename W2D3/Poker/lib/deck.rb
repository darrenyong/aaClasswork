require_relative "card"

class Deck
    SUITS = [:heart, :club, :diamond, :spade].freeze
    VALUES = (1..13).to_a

    attr_reader :deck

# "♠"
# "♣"
# "♦"
# "♥"

    def initialize
        @deck = Array.new(52)
        fill_deck
    end

    def fill_deck
        @deck.each_index do |idx|
            value = idx % 13
            case idx
            when 0..12
                suit = :heart
            when 13..25
                suit = :club
            when 26..38
                suit = :diamond
            when 39..51
                suit = :spade
            end
            @deck[idx] = Card.new(value+1, suit)
        end
    end

    def [](position)
        @deck[position]
    end

end