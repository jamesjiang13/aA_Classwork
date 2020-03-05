require_relative 'piece.rb'

class King < Piece
  include steppable

  def initialize

    @symbol = :K
  end
  
  def move_dirs
    # will override parent class
  end
end