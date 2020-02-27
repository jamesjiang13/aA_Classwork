class Item
    attr_accessor :title, :description
    attr_reader :deadline, :done
    
    def self.valid_date?(date)
        parts = date.split("-")
        return false if parts[0].length != 4
        return false if parts[1].to_i < 1 || parts[1].to_i > 13
        return false if parts[2].to_i < 1 || parts[2].to_i > 31
        true    
    end

    def initialize(title, deadline, description)
        
        @title = title
        @deadline = deadline
        @description = description
        @done = false

        raise "not valid date" if !Item.valid_date?(@deadline)
    end

    def deadline=(new_deadline)
        @deadline = new_deadline if Item.valid_date?(new_deadline)
    end

    def toggle
        @done = !@done
    end
    
end

