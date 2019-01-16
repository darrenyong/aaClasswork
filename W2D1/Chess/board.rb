require_relative 'piece'

class Board
  attr_reader :chess_board, :sentinel

  def initialize
    @chess_board = Array.new(8) {Array.new(8)}
    @sentinel = NullPiece.instance
    fill_board
  end

  def fill_board
    @chess_board.each_index do |idx1|
      @chess_board.each_index do |idx2|
        if idx1 == 0 || idx1 == 1 || idx1 == 6 || idx1 == 7
          @chess_board[idx1][idx2] = Piece.new([idx1, idx2])
        else
          @chess_board[idx1][idx2] = sentinel
        end
      end
    end
  end

  def move_piece(start_pos, end_pos)
    raise NoPieceOnStart if self[start_pos].is_a?(NullPiece)
    raise EndPosOccupied unless self[end_pos].is_a?(NullPiece)
    target_piece = self[start_pos]  # Instance of piece
    target_piece.pos = end_pos
    self[end_pos] = target_piece
    self[start_pos] = sentinel
  end

  def [](pos)
    @chess_board[pos[0]][pos[1]]
  end

  def []=(pos, value)
    @chess_board[pos[0]][pos[1]] = value
  end

end

class NoPieceOnStart < StandardError; end
class EndPosOccupied < StandardError; end