class Board
    attr_reader :size 

    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n * n
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, value)
        row, col = pos
        @grid[row][col] = value
    end

    def num_ships
        count = 0
        @grid.each { |row| count += row.count(:S) }
        count
    end

    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            p 'you sunk my battleship!'
            return true
        else
            self[pos] = :X
            return false
        end
    end

    def place_random_ships
        quarter = @size / 4
        while self.num_ships < quarter
            row = (0...@grid.length).to_a.sample
            col = (0...@grid.length).to_a.sample
            @grid[row][col] = :S
        end

    end

    def hidden_ships_grid
        new_grid = @grid.map do |row| 
            row.map {|ele| ele == :S ? ele = :N : ele}
        end
        new_grid
    end

    def self.print_grid(array)
        array.each do |row|
            row.each_with_index do |ele, i|
                if i != row.length-1
                    print "#{ele} " 
                else    
                    print "#{ele}" 
                end
            end
            puts
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end

end
