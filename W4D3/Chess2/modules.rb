module Slideable
  attr_reader :HORIZONTAL_DIRS, :DIAGONAL_DIRS
  @@HORIZONTAL_DIRS = [[1,0],[0,1],[-1,0],[0,-1]]
  @@DIAGONAL_DIRS = [[1,1],[-1,-1],[-1,1],[1,-1]]

  def moves
    valid_moves = []
    self.move_dirs.each do |dir|
      valid_moves.concat(grow_unblocked_moves_in_dir(dir))
    end
    print "hello"
    p valid_moves
    valid_moves
  end

  # private
  def move_dirs #returns array: directionality based on class
    raise "No method found: move_dirs"
  end

  def array_addition(pos, dir)
    next_coords = []
    (0..1).each { |i| next_coords << pos[i] + dir[i] }
    next_coords
  end

  def grow_unblocked_moves_in_dir(dir)
    moves = []
    current_position = array_addition(pos, dir)
    off_board = !current_position[0].between?(0,7) && !current_position[1].between?(0,7)
    spot_taken = board[current_position] != NullPiece.instance

    until off_board || spot_taken
      moves << current_position
      current_position = array_addition(current_position, dir)
    end
    moves
  end
end

module Steppable
  def moves  
    possible_moves = []
    self.move_diffs.each do |dir|
      possible_moves << array_addition(pos, dir)
    end
    possible_moves
  end

  def array_addition(pos, dir)
    next_coords = []
    (0..1).each { |i| next_coords << pos[i] + dir[i] }
    next_coords
  end

  def move_diffs
    raise "No method found: move_diffs"
  end
end