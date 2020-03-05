require_relative 'piece.rb'

class Bishop < Piece
  include slideable

  def initialize

    @symbol = :B
  end
  
  def move_dirs
    # will override parent class
  end
end