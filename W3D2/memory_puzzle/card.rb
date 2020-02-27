class Card
    attr_reader :value, :face
    def initialize(value)
        @face = false   # true = up , down = false
        @value = value
    end

    def hide
        @face = false
    end

    def reveal 
        @face = true
    end

    def to_s     # convert instance of card to string so that you can compare to other instances 
        if @face == true 
            self.value
        else 
            "_"
        end 
    end

    def ==(other_card) 
        self.value == other_card.value
    end
    #hide, #reveal, #to_s, and #== methods.
end

