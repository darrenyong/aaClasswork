require_relative 'Game'
require_relative 'Board'

class Card
    attr_reader :face_value
    attr_accessor :card_hidden

    def initialize(face_value)
        @face_value = face_value
        @card_hidden = true
    end

    def hide
        # change card_hidden to true
        @card_hidden = true
    end

    def reveal(pos)
        # display face value, card_hidden = false
        @card_hidden = false
        row, col = pos
        @grid[row][col].face_value
    end

    def to_s
    end

    def ==(pos1, pos2)
        row1, col1 = pos1
        row2, col2 = pos2
        @grid[row1][col1] == @grid[row2][col2]
    end
end