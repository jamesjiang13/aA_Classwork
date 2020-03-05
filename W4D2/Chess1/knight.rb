require_relative 'piece.rb'

class Knight < Piece
  include steppable

  def initialize

    @symbol = :N
  end
  
  def move_dirs
    # will override parent class
  end
end