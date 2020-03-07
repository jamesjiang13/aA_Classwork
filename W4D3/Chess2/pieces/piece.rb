require "singleton"
require_relative "modules.rb"
#require_relative "rook.rb"
# require_relative "knight.rb"
# require_relative "bishop.rb"
# require_relative "queen.rb"
# require_relative "king.rb"
# require_relative "pawn.rb"

class Piece
  attr_reader :color, :board, :pos
  attr_writer :color
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

  def to_s
    symbol.to_s
  end

  def pos=(val)
    self.board[pos[0]][pos[1]] = val
  end

  def empty?
    #what are we checking to see is empty?
  end

  private
  def move_into_check?(end_pos)
    #identifies if a move would cause player's king to be attacked (in check)
  end

end                                                                        


class NullPiece < Piece
  include Singleton
  attr_reader :symbol

  def initialize#(color="white", board, pos)
   # super
  end


   #@sentinel: NullPiece #private instance variable
end