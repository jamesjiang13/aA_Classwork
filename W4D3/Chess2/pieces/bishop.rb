require_relative 'piece.rb'

class Bishop < Piece
  include Slideable
  attr_reader :symbol
  
  def initialize(color="white", board, pos)
    @symbol = :B
    super
  end
  
  def move_dirs  # will override parent class
    @@DIAGONAL_DIRS
  end
end