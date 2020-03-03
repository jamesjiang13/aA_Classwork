require_relative "00_tree_node"

class KnightPathFinder
    attr_reader :root_node, :considered_pos

    def initialize(start)
        @root_node = PolyTreeNode.new(start)
        @considered_pos = [@root_node.value] 
        self.build_move_tree
    end

    def self.valid_moves(pos)         
        moves = []                           
        row,col = pos
        [-2,-1,1,2].each do |i|
            [-2,-1,1,2].each do |j|
                if i + j != 0 && i != j
                    moves << [row + i, col + j] 
                end
            end
        end
        moves.select {|move| move[0].between?(0,7) && move[1].between?(0,7) }
    end

    def new_move_positions(pos)     # generate valid moves, filter out past moves
        possible = KnightPathFinder.valid_moves(pos)
        new_moves = possible - @considered_pos
        @considered_pos += new_moves 
        new_moves
    end

    def build_move_tree
        new_arr = [@root_node]      # @root_node.children ?

        while !new_arr.empty?
            parent = new_arr.pop
            pos = parent.value
            children = new_move_positions(pos)    # return's an array

            children.each do |child|
                kiddo = PolyTreeNode.new(child)
                parent.add_child(kiddo)
                new_arr.unshift(kiddo)
            end
        end
        @root_node

        # [1,2],[2,1] new_move_positions(@start)   
        # PolyTreeNode.new([1,2]) # gives you node
        # link node to 0,0
        # run BMT for [1,2]
        # return [[0, 4], [2, 0], [2, 4], [3, 1], [3, 3]] # create 5 new nodes
        # link node to 1,2

        # pop off considered position arr, that's the start
        # w/ start, generate new moves, add to considered pos
        # pop again to take each new one, run BMT for popped
        # how can we tell it to stop `creating moves
        # how do you know you're at a leaf
    end

    def find_path(end_pos)
        end_instance = self.root_node.bfs(end_pos)              # find end as instance
        # return self if self.parent.nil?                 # base case for possible end 
 
        path = []

        while path[0] != @root_node
            path.unshift(end_instance)
            end_instance = path[0].parent
        end
        p path.map(&:value)
    end


    def trace_path_back #TPB
    return self.value if !self.parent.nil?    # return array of coords
    end

        #should return the values from end_pos to root
        #should add each value to an array.

    
end

kpf = KnightPathFinder.new([0,0])

kpf.find_path([6,2])



