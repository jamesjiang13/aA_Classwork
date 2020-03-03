class PolyTreeNode

    attr_reader :parent, :children, :value

    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end

    def parent=(par)
        if self.parent == nil 
            @parent = par
        else
            self.parent.children.delete(self)
            @parent = par
            return nil if par == nil
        end
        @parent.children << self 
    end

    def add_child(child_node)
        child_node.parent = self
        self.children << child_node if child_node.parent != self
    end

    def remove_child(child_node)
        child_node.parent = nil
        raise "error" if child_node.parent != self
    end

    def dfs(target)
        return self if target == self.value

        self.children.each do |child|
            # child.value == target
            # return child if child.dfs(target).value == target #A
            found = child.dfs(target)
            return found if found != nil
        end

        nil
    end

    def bfs(target)
        new_arr = [self]
        return false if new_arr.empty?
        
        while !new_arr.empty?
            temp = new_arr.pop
            return temp if temp.value == target
            temp.children.each {|child| new_arr.unshift(child) }
        end
        nil
    end

    def inspect
        "#<Stack:#{self.object_id}>"
    end

end