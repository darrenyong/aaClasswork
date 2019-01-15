require_relative "lib/00_tree_node.rb"


class KnightPathFinder

  attr_reader :considered_positions
  def initialize(arr)
    @root_node = PolyTreeNode.new(arr)
    @considered_pos = [arr]
    self.build_move_tree
  end

  def build_move_tree

  end

  def self.valid_moves(pos)

  end

  def considered?(arr)
    if @considered_pos.include?(arr) 
      return true
    else 
      return false 
    end  
  end

end