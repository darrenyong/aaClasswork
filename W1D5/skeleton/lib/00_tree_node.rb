require "byebug"
class PolyTreeNode
    attr_reader :value, :parent, :children

    
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent
        @parent
    end

    def children
        @children
    end

    def value
        @value
    end

    def parent=(parent_val)
        if @parent != nil 
            @parent.children.delete(self)
        end

        if !parent_val.nil?
            # Set parent property
            @parent = parent_val
            # Adds node to parent's array of children unless parent == nil
            parent_val.children << self if !parent_val.children.include?(self)
        else
            @parent = parent_val
        end
    end

    def add_child(child_node)
        child_node.parent = self 
    end

    def remove_child(child_node)
        if self.children.include?(child_node)
            child_node.parent = nil 
        else
            raise "Node not a child"
        end
    end

    def dfs(target_value)
        return self if self.value == target_value

        if self.children.length != 0
            self.children.each do |child|
                found = child.dfs(target_value)     # either node or nil
                return found if found  
            end
        end 
        nil
    end

    def bfs(target_value)
        queue = Array.new
        queue << self

        until queue.empty?
            current_val = queue.shift
            if current_val.value == target_value
                return current_val
            else
                current_val.children.each {|ele| queue << ele}
            end
        end

        nil
    end

end
