class Board
    attr_reader :board

    def initialize
        @board = Array.new(3) {Array.new(3, '_')}
    end

    def valid?(pos)
        row, col = pos
        return false if row < 0 || row >= @board.length
        return false if col < 0 || row >= @board.length 
        true
    end

    def [](pos)
        @board[pos[0]][pos[1]]
    end

    def []=(pos,value)
        @board[pos[0]][pos[1]] = value
    end

    def empty?(pos)
        self[pos] == "_"
    end

    def place_mark(pos, mark)
        if empty?(pos) && valid?(pos)
            self[pos] = mark
            return true
        end
        raise 'Invalid mark'
    end

    def print_board
        @board.each do |row|
            row.each do |ele|
                print " #{ele}" 
            end
            puts
        end
    end

    def win_row?(mark)
        @board.any? { |row| row.all? {|ele| ele == mark } }
    end

    def win_col?(mark)
        new_grid = @board.transpose
        new_grid.any? {|row| row.all? {|ele| ele == mark } }
    end

    def win_diagonal?(mark)
        left_right = []
        right_left = []
        (0...@board.length).each do |i|
            left_right << @board[i][i]
        end
        return true if left_right.all?{|ele| ele == mark}
        
        col_idx = @board.length-1
        (0...@board.length).each do |row_idx|
            right_left << @board[row_idx][col_idx]
            col_idx -= 1
        end
        right_left.all? {|ele| ele == mark}
    end

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        @board.any? {|row| row.any?("_")}
    end

end
