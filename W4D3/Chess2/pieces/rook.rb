require_relative 'piece.rb'

class Rook < Piece
  include Slideable
  attr_reader :symbol
  def initialize(color="white", board, pos) # POST LUNCH: ADD PARAMETERS TO OTHER CLASSES
    @symbol = :R
    super
  end
  
  def move_dirs
    @@HORIZONTAL_DIRS
    # will override parent class
  end
end