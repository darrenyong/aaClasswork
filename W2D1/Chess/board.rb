require_relative 'piece'

class Board
  attr_reader :chess_board, :sentinel

  def initialize
    @chess_board = Array.new(8) {Array.new(8)}
    @sentinel = NullPiece.instance
  end


end

class NoPieceOnStart < StandardError; end
class EndPosOccupied < StandardError; end