class Room
    attr_reader :capacity, :occupants
    def initialize(capacity)
        @capacity = capacity
        @occupants = []
    end

    def full?
        if @occupants.length == @capacity
            return true
        end
        false
    end


    def available_space
        @capacity - @occupants.length
    end

    def add_occupant(name)
        if !self.full? 
            @occupants << name
            return true
        else
            false
        end
    end

end
