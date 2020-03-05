require_relative 'piece.rb'

class Queen < Piece
  include slideable

  def initialize

    @symbol = :Q
  end
  
  def move_dirs
    # will override parent class
  end
end