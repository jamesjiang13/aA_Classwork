require_relative "piece.rb"
class Board
  attr_reader :grid
  def initialize 
    @grid = Array.new(8){Array.new(8, [])}
    build_board
  end

  def build_board
    (0..7).each do |i|
      (0..7).each do |j|
        if i.between?(0,1) || i.between?(6,7)
          self[[i,j]] = Piece.new
        else
          self[[i,j]] = NullPiece.instance
        end
      end
    end
  end

  def move_piece(start_pos, end_pos)      # maybe prompt for rescue/retry instead of error
    raise "There's no piece there" if self[start_pos].is_a? NullPiece
    raise "invalid position" if !valid_pos?(end_pos)
    # this is where the move happens
    self[end_pos] = self[start_pos] 
    self[start_pos] = NullPiece.instance

  end

  def valid_pos?(pos)
    row, col = pos
    return false if !row.between?(0,7) || !col.between?(0,7)
    true
  end

  def [](pos) #[1,2]
    row, col = pos
    grid[row][col] 
  end

  def []=(pos, value)
    row, col = pos
    grid[row][col] = value
  end


  #@sentinel: NullPiece #private instance variable
end