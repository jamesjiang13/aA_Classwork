require_relative 'piece.rb'

class Knight < Piece
  include Steppable
  attr_reader :symbol
  def initialize(color="white", board, pos)
    @symbol = :N
    super
  end
  
  def move_diffs # will override parent class
    [
      [1,2],
      [1,-2],
      [-1,2],
      [-1,-2],
      [2,1],
      [2,-1],
      [-2,1],
      [-2,-1]
    ] 
  end
end