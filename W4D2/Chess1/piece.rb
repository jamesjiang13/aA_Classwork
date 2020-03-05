require "singleton"
module Slideable
  attr_reader :HORIZONTAL_DIRS, :DIAGONAL_DIRS
  HORIZONTAL_DIRS = [[1,0],[0,1],[-1,0],[0,-1]]
  DIAGONAL_DIRS = [[1,1],[-1,-1],[-1,1],[1,-1]]

  def moves
    #need start position -> self.pos
    #need class
    
    #calls M_d, & gumid
    possible_moves = []
    self.move_dirs.each do |dir|
      possible_moves.concat(grow_unblocked_moves_in_dir(dir))
    end
    possible_moves
  end

  private
  def move_dirs #returns array: directionality based on class

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
    
  end

  def move_diffs

  end
end

class Piece
  attr_reader :color, :board, :pos
  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos

  end

  def moves() #returns an array of places a piece can move to

  end

  # def valid_move?()
  #   #piece in the way?
  #   #doesn't follow rules
  #   #have move_piece on board class - checks for boundaries and empty squares
  # end
end


class NullPiece < Piece
  include Singleton
  def initialize
  end
end