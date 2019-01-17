require_relative 'piece'
require "byebug"

class Board
  attr_reader :chess_board, :sentinel

  def initialize
    @chess_board = Array.new(8) {Array.new(8)}
    @sentinel = NullPiece.instance
    fill_board
  end

  def fill_board
    @chess_board.each_index do |row|
      @chess_board.each_index do |col|
        if row == 1 
          @chess_board[row][col] = Piece.new([row, col], :pawn, self, :light_black)
        elsif row == 6
          @chess_board[row][col] = Piece.new([row, col], :pawn, self, :light_white)
        elsif row == 0
          case col
          when 0, 7
            @chess_board[row][col] = Rook.new([row, col], :rook, self, :light_black)
          when 1, 6
            @chess_board[row][col] = Knight.new([row, col], :knight, self, :light_black)
          when 2, 5
            @chess_board[row][col] = Bishop.new([row, col], :bishop, self, :light_black)
          when 3
            @chess_board[row][col] = Queen.new([row, col], :queen, self, :light_black)
          when 4
            @chess_board[row][col] = King.new([row, col], :king, self, :light_black)
          end
        elsif row == 7
          case col
          when 0, 7
            @chess_board[row][col] = Rook.new([row, col], :rook, self, :light_white)
          when 1, 6
            @chess_board[row][col] = Knight.new([row, col], :knight, self, :light_white)
          when 2, 5
            @chess_board[row][col] = Bishop.new([row, col], :bishop, self, :light_white)
          when 3
            @chess_board[row][col] = Queen.new([row, col], :queen, self, :light_white)
          when 4
            @chess_board[row][col] = King.new([row, col], :king, self, :light_white)
          end
        else
          @chess_board[row][col] = sentinel
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

  def find_king(color)
    chess_board.each_with_index do |row, i|
      row.each_with_index do |col, j|
        piece = self[[i, j]]
        return [i, j] if piece.is_a?(King) && piece.color == color 
      end 
    end
  end

  def find_opposing_moves(color)
    oc = opposing_color(color)
    possible_moves = []
    chess_board.each_with_index do |row, i|
      row.each_with_index do |col, j|
        piece = self[[i, j]]
        if piece.moves.nil?
          next
        elsif piece.color == oc
          possible_moves += piece.moves
        end
      end 
    end
    return possible_moves
  end
  
  def in_check?(color)
    king_pos = find_king(color)
    opposing_moves = find_opposing_moves(color)
    opposing_moves.include?(king_pos)
  end

  def checkmate?(color)
    king_moves = []
    king_pos = find_king(color)
    king_moves << king_pos
    king_moves += self[king_pos].moves
    opposing_moves = find_opposing_moves(color)

    king_moves.each do |sub_arr|
      return false if !opposing_moves.include?(sub_arr)
    end

    return true
  end




  def opposing_color(color)
    color == :light_black ? :light_white : :light_black
  end

end

class NoPieceOnStart < StandardError; end
class EndPosOccupied < StandardError; end