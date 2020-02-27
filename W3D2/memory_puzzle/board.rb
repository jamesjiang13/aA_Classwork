require_relative "./card.rb"
class Board
    attr_reader :grid, :cards
    
    def initialize
        @grid = Array.new(4){Array.new(4,"_")}
        @cards = []
        2.times { ("A".."H").to_a.each {|card| @cards << Card.new(card)} }
    end 

    def populate()
        pairs = []                      # sets all the pair coordinates
        (0...@grid.length).each do |i1|
            (0...@grid.length).each { |i2| pairs << [i1,i2] }
        end
        
        @cards.each do |card|   
            count = 0
            while !pairs.empty? && count <2
                current_pair = pairs.sample
                row, col = current_pair
                @grid[row][col] = card
                pairs.delete(current_pair)
                count += 1
            end
        end
        @grid
    end

    def render 
        @grid.each do |row|
            puts row.join(" ")
        end 
    end 

    def won?
        @grid.flatten.all?{|card| card.face == true}
    end 

    def [](pos)
        row, col = pos
        @grid[row][col]
    end 

    def reveal(pos) 
        if self[pos].face == false
            self[pos].reveal
            return self[pos].value
        end
    end 



end 
