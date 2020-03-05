require_relative 'piece.rb'

class Queen < Piece
  include Slideable
  attr_reader :symbol

  def initialize(color="white", board, pos)
    @symbol = :Q
    super
  end
  
  def move_dirs   # will override parent class
    @@HORIZONTAL_DIRS + @@DIAGONAL_DIRS
  end
  
end