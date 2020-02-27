require_relative "./card"
require_relative "./board"


class Game
    attr_reader :board, :previous_guessed
    
    def initialize
        @board = Board.new
        @previous_guessed = []
        @board.populate
    end

    def make_guess(pos)
        puts @previous_guessed
        if @previous_guessed.empty?
            @board[pos].reveal
            @previous_guessed << @board[pos]
           
        elsif @previous_guessed[0] == @board[pos]
            @board[pos].reveal
        else 
            sleep(2)
            @board[pos].hide
            @previous_guessed[0].hide
        end 
        @board.render
        @previous_guessed = []
        sleep(2)
        system("clear")
        
    end 

    def play
        
        while !@board.won?
            @board.render
            puts "Enter a valid position in the form '1 2'"
            pos = gets.chomp.split(" ").map(&:to_i)
            make_guess(pos)
        end 
        print 'You win'
    end
end
