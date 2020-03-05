require_relative 'piece.rb'

class Rook < Piece
  include slideable

  def initialize

    @symbol = :R
  end
  
  def move_dirs
    # will override parent class
  end
end