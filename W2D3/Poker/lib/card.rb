class Card
    attr_reader :value, :suit
    
    def initialize(value, suit)
        @value = value
        @suit = suit
        if value < 0 || value > 13 || !value.is_a?(Integer)
            raise InvalidBounds 
        end 
    end
end

class InvalidBounds < StandardError; end