class Board
  attr_reader :chess_board, :sentinel

  def initialize
    @chess_board = Array.new(8) {Array.new(8)}
  end


end