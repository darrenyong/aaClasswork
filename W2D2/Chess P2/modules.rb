require "byebug"
module SlidingPiece
  HORIZONTAL_DIRS = [[0,1], [0,-1], [1,0], [-1,0]]
  DIAGONAL_DIRS = [[1,1], [1,-1], [-1,1], [-1,-1]]


  def moves
    possible_moves = []
    move_dirs.each do |dir|
      start_p = self.pos 
      new_row = start_p[0] + dir[0]
      new_col = start_p[1] + dir[1]
      next if new_row < 0 || new_col < 0
      next if new_row > 7 || new_col > 7

      until !(self.board[[new_row, new_col]].is_a?(NullPiece))
        break if new_row < 0 || new_col < 0
        break if new_row > 7 || new_col > 7
        possible_moves << [new_row, new_col]
        new_row = new_row + dir[0] 
        new_col = new_col + dir[1]
      end

      # debugger
      if new_row <= 7 && new_col <= 7 && new_row >= 0 && new_col >= 0
        if self.board[[new_row, new_col]].color != self.color
          possible_moves << [new_row, new_col]
        end
      end
    end
    return possible_moves
  end
end


module SteppingPiece

  def moves
    possible_moves = []
    move_dirs.each do |dir|
      start_p = self.pos 
      new_row = start_p[0] + dir[0]
      new_col = start_p[1] + dir[1]
      next if new_row < 0 || new_col < 0
      next if new_row > 7 || new_col > 7

      if self.board[[new_row, new_col]].is_a?(NullPiece)
        possible_moves << [new_row, new_col]
      end
    end

    return possible_moves
  end


end

