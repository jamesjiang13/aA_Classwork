require_relative 'board.rb'
require_relative 'human_player.rb'

class Game
    attr_reader :board, :current_player

    def initialize(player1_mark, player2_mark)
        @player1 = HumanPlayer.new(player1_mark)
        @player2 = HumanPlayer.new(player2_mark)
        @current_player = @player1
        @board = Board.new
    end

    def switch_turn
        if @current_player == @player1
            @current_player = @player2
        else
            @current_player = @player1
        end
    end

    def play
        while @board.empty_positions?
            @board.print_board
            puts
            pos = @current_player.get_position
            @board.place_mark(pos, @current_player.mark)
            if @board.win?(@current_player)
                print "you win #{@current_player}!"
                return
            else
                self.switch_turn
            end
        end
        print "It's a draw"
    end
end
