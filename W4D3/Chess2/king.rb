require_relative 'piece.rb'

class King < Piece
  include Steppable
  attr_reader :symbol
  
  def initialize(color="white", board, pos)
    @symbol = :K
    super
  end
  
  def move_diffs # will override parent class
    [[1,0],[1,1],[1,-1],[0,1],[0,-1],[-1,-1],[-1,1],[-1,0]] 
  end
end