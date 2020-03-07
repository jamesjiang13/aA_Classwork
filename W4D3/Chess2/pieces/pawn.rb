require_relative "piece.rb"

class Pawn < Piece
    attr_reader :symbol
  def initialize(color="white", board, pos)
    @symbol = :P
    super
  end

  def moves
    directional_step = []               # fix var name later

    forward_steps.each do |step|        # [[2,0],[1,0]]
      coordinate = []
      step.each do |el|
        coordinate << el * forward_dir
      end
      directional_step << coordinate 
    end
    
    valid_moves = []

    if at_start_row?    
      directional_step.each do |step|
        valid_moves << array_addition(pos, step)
      end
    else
      return array_addition(pos, directional_step[1])
    end
    valid_moves
  end

  def array_addition(pos, dir)    # include into module @ later date?
    next_coords = []
    (0..1).each { |i| next_coords << pos[i] + dir[i] }
    next_coords
  end


  def move_dirs
    forward_steps + side_attacks
  end

  def forward_steps
    [[2,0],[1,0]]
  end

  def forward_dir
    color == "white" ? 1 : -1  # to account for if you're top or bottom of board
  end

  def side_attacks
    [[-1,-1], [1,1]]
  end

  def at_start_row?
    pos[0] == 1 || pos[0] == 6
  end
end
