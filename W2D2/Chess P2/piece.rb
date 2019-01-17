require 'singleton'

class Piece
  attr_accessor :pos, :symbol, :board, :color

  def initialize(pos, symbol, board, color)
    @pos = pos
    @symbol = symbol
    @board = board
    @color = color
  end

  def moves; end

end

class Rook < Piece
  include SlidingPiece
  def move_dirs
    HORIZONTAL_DIRS 
  end
end


class Bishop < Piece
  include SlidingPiece
  def move_dirs
    DIAGONAL_DIRS
  end
end

class Queen < Piece
  include SlidingPiece
  def move_dirs
    DIAGONAL_DIRS + HORIZONTAL_DIRS
  end
end

class Knight < Piece
  include SteppingPiece
  def move_dirs
    return [[2,1], [2,-1], [-2,1], [-2,-1], [1,2], [1,-2], [-1,2], [-1,-2]]
  end
end

class King < Piece
  include SteppingPiece
  def move_dirs
    return [[1,0], [-1,0], [0,1], [0,-1], [1,1], [1,-1], [-1,1], [-1,-1]]
  end
end

class Pawn < Piece
  include SteppingPiece
  def move_dirs
    return [[0,1]]
  end
end








class NullPiece < Piece
  include Singleton
  def initialize; end
  def moves; end
end

