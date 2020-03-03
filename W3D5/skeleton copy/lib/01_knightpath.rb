require "00_tree_node.rb"

class KnightPathFinder

    def initialize(start)
        @start = start
        @row = start[0]
        @col = start[1]
        @root_node = PolyTreeNode.new(start)
        @considered_pos = [start] 
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

    def new_move_positions(pos)             # generate valid moves, filter out past moves
        possible = KnightPathFinder.valid_moves(pos)
        new_moves = possible - @considered_pos
        @considered_pos += new_moves 
        new_moves
    end

    def build_move_tree
        [1,2],[2,1] new_move_positions(@start)   
        PolyTreeNode.new([1,2]) # gives you node
        link node to 0,0
        run BMT for [1,2]
        return [[0, 4], [2, 0], [2, 4], [3, 1], [3, 3]] # create 5 new nodes
        link node to 1,2


        # pop off considered position arr, that's the start
        # w/ start, generate new moves, add to considered pos
        # pop again to take each new one, run BMT for popped
        # how can we tell it to stop creating moves
        # how do you know you're at a leaf

    end
end
