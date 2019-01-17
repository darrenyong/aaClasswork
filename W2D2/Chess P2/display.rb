require_relative "cursor"
require 'colorize'

class Display
  PIECE_HASH = {
      rook: "♖",
      knight: "♘",
      bishop: "♗",
      queen: "♕",
      king: "♔",
      pawn: "♙"
    }

  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board
  end

  def render
    display_board = []
    c_row = @cursor.cursor_pos[0]
    c_col = @cursor.cursor_pos[1]
    @board.chess_board.each_with_index do |row, i|
      display_row = ""
      row.each_with_index do |piece, j|
        temp_realp = "#{PIECE_HASH[piece.symbol]} ".colorize(piece.color)
        temp_nullp = "_ "
        if piece.is_a?(NullPiece)
          if i == c_row && j == c_col
            if @cursor.selected
              display_row += temp_nullp.colorize(:green)
            else
              display_row += temp_nullp.colorize(:red)
            end
          else
            display_row += temp_nullp
          end
        else
          if i == c_row && j == c_col
            if @cursor.selected
              display_row += temp_realp.colorize(:green)
            else
              display_row += temp_realp.colorize(:red)
            end
          else
            display_row += temp_realp
          end
        end
      end
      display_board << display_row
      puts display_row
    end
    @cursor.get_input
    puts "----------------"
    self.render
    return nil
  end
end