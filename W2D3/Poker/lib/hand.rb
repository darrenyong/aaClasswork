class Hand

    def initialize
    end

    def is_straight_flush?(hand)
        sorted_hand = hand.sort_by { |card| card.value }
        sorted_hand.each.with_index do |card, idx|
            next if idx + 1 == hand.length
            return false if sorted_hand[idx].value + 1 != sorted_hand[idx+1].value
            return false if sorted_hand[idx].suit != sorted_hand[idx+1].suit
        end
        true
    end

    def is_4_kind?(hand)

    end

    def is_full_house?(hand)

    end

    def is_flush?(hand)

    end

    def is_straight?(hand)

    end

    def is_3_kind?(hand)

    end

    def is_2_pair?(hand)

    end

    def is_pair?(hand)

    end


end