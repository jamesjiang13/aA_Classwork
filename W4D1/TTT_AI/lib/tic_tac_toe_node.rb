require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark
  def initialize(board, next_mover_mark, prev_move_pos = nil)
      @board = board
      @children = []
      @next_mover_mark = next_mover_mark
      @prev_move_pos = prev_move_pos
    
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
      (0...9).times { TicTacToeNode.new(@board, @next_mover_mark, prev_move_pos)
  end
end
