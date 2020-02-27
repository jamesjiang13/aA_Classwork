# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        return nil if self.length == 0
        self.max - self.min
    end

    def average
        return nil if self.length == 0 
        (self.sum * 1.0) / self.length
    end

    def median
        return nil if self.length == 0 
        sorted = self.sort
        if sorted.count.odd?
            sorted[sorted.length / 2]
        else
            num1 = sorted[sorted.length / 2]
            num2 = sorted[(sorted.length - 1) / 2]
            (num1 + num2) / 2.0
        end
    end

    def counts
        count = Hash.new(0)
        self.each { |ele| count[ele] += 1 }
        count
    end

    def my_count(letter)
        count = 0
        self.each {|ele| count += 1 if ele == letter }
        count
    end

    def my_index(letter)
        self.each_with_index do |ele, i|
            return i if ele == letter
        end
        nil
    end

    def my_uniq
        hash = {}
        self.each {|ele| hash[ele] = true}
        hash.keys
    end

    def my_transpose
        new_arr = []
        
        (0...self.length).each do |row|
            temp = []
            (0...self.length).each do |col|
                temp << self[col][row]
            end
            new_arr << temp
        end

        new_arr 
    end
    
end
