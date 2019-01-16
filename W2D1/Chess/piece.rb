require 'singleton'

class Piece
  attr_writer :pos

  def initialize(pos)
    # @color = color
    # @board = board
    @pos = pos
  end

end

class NullPiece < Piece
  include Singleton
  def initialize
    
  end
end

