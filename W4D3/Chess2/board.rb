require 'byebug'

Dir["./pieces/*.rb"].each {|file| require_relative file }

class Board
  attr_reader :grid
  
  def initialize 
    @grid = Array.new(8){Array.new(8, [])}
    build_board
  end

  def build_board
    (0..7).each do |i|
      (0..7).each do |j|
        pos = [i, j]
        self[pos] = add_piece(pos)
      end
    end    
    set_color
  end

  def set_color
    [6,7].each do |row|
      (0..7).each do |col|
        self[[row,col]].color = "black"
      end
    end
  end

  def add_piece(pos)
    case pos 
      when [0,0], [0,7], [7,0], [7,7]
        Rook.new(grid, pos)
      when [0,4], [7,4]
        King.new(grid, pos)
      when [0,3], [7,3]
        Queen.new(grid, pos)
      when [0,5], [0,2], [7,2], [7,5]
        Bishop.new(grid, pos)
      when [0,1], [0,6], [7,1], [7,6]
        Knight.new(grid, pos)        
      else
        if pos[0] == 1 || pos[0] == 6
          Pawn.new(grid, pos)
        else
          NullPiece.instance
        end
    end
  end

  def move_piece(start_pos, end_pos)    
    raise "There's no piece there" if self[start_pos].is_a? NullPiece
    raise "invalid position" if !valid_pos?(end_pos)

    if valid_move?(start_pos,end_pos)
      self[end_pos] = self[start_pos] 
      self[start_pos] = NullPiece.instance
    else
      raise 'Invalid move, try again'
    end
  end

  def valid_move?(start_pos,end_pos)
    piece = self[start_pos]
    piece.moves.include?(end_pos)  # method taken from module, returns array of valid moves
  end

  def valid_pos?(pos)
    row, col = pos
    return false if !row.between?(0,7) || !col.between?(0,7)
    true
  end

  def [](pos)
    row, col = pos
    grid[row][col] 
  end

  def []=(pos, value)
    row, col = pos
    grid[row][col] = value
  end
 
  def print_board
    (0...grid.length).each do |i|
      (0...grid.length).each do |j|
        pos = [i, j]
        print "#{self[pos]}  |".ljust(6)
      end
      puts
      puts "---------------------------------------------"  
    end
  end
end


b = Board.new

b.print_board
b.move_piece([1,4],[3,4]) # white pawn
b.move_piece([6,3],[4,3]) # black pawn 
b.move_piece([0,6],[2,5])
b.move_piece([0,4],[1,4])

puts
b.print_board
puts
