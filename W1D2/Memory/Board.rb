require 'byebug'
require_relative 'Card'
require_relative 'Game'

class Board
    attr_accessor :grid

    def initialize
        @grid = Array.new(4) {Array.new(4)}
    end

    # [[], [], [], []]
    # [[], [], [], []]
    # [[], [], [], []]
    # [[], [], [], []]

    def populate
        cards = ("a".."z").to_a.shuffle!
        random_cards = (cards.pop(8).to_a * 2).shuffle!
        # byebug
        @grid.each_with_index do |row, idx1|
            row.each_with_index do |column, idx2|
                @grid[idx1][idx2] = Card.new(random_cards.pop)
            end
        end
    end

    def board_full?
        !@grid.flatten.any?(nil)
    end

    def render
        # iterate. check for status of card. If not hidden, reveal the face
        # else use a standard mark
        grid_string = ""
        @grid.flatten.each do |el|
            el.card_hidden ? grid_string += "#" : grid_string += el.face_value
        end

        grid_string.insert(4, "\n")
        grid_string.insert(9, "\n")
        grid_string.insert(14, "\n")

        return grid_string
    end

    def won?
    end

    def reveal(row, column)
        @grid[row][column].card_hidden = false
    end

    # def []=(pos)
    #     @grid[pos]
    # end
    
    def [](value)
        @grid[value]
    end

end