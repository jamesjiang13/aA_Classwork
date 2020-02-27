class HumanPlayer
    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position
        print "Player #{mark}, please enter position as two space-separated numbers: "
        input = gets.chomp.split
        print "try again" if input.length != 2
        row, col = input
        [row.to_i, col.to_i]
    end

end
