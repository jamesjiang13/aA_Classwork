require "byebug"

class Array

    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i +=1
        end
       self
    end

# a = [1, 2, 3]
# a.my_each { |num| num * 2 } # => 
# a.my_each { |num| num * 4 } # => 
# p a

    def my_select(&prc)
        arr = []
        self.my_each { |el| arr << el if prc.call(el) }
        arr 
    end

# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []


    def my_reject(&prc)
        arr = []
        self.my_each { |el| arr << el if !prc.call(el) }
        arr 
    end

# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]    

    def my_any?(&prc)
        self.my_each {|el| return true if prc.call(el) }
        false
    end

    def my_all?(&prc)
        count = 0
        self.my_each {|el| count += 1 if prc.call(el) }
        count == self.length
    end

# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# a.my_all? { |num| num > 1 } # => false
# a.my_all? { |num| num < 4 } # => true

    def my_flatten
        return [self] if self.is_a?(Array) == false
        res = []
        # debugger
        self.each do |ele|
            if !ele.is_a?(Array)
                res << ele
            else
                res += ele.my_flatten
            end
        end
        res
    end

# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]
# p [4, [5, 6]].my_flatten

    def my_zip(*args)
        new_arr = []
        (0...self.length).each do |i|
            sub_arr = []
            sub_arr << self[i]
            args.each {|arg| sub_arr << arg[i] }
            new_arr << sub_arr 
        end 
        new_arr
    end

# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]] 

    def my_rotate(revs = 1)
        arr = self.dup
        if revs > 0
            revs.times do
                last = arr.shift
                arr << last
            end
            return arr
        elsif revs < 0
            (revs * -1).times do 
                first = arr.pop
                arr.unshift(first)
            end
            return arr
        end
    end

# a = [ "a", "b", "c", "d" ]
# a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]


    def my_join(d="")
        res = ''
        self.each_with_index do |char, i|
            if i < self.length - 1
                res += "#{char}#{d}"
            else
                res += "#{char}"
            end
        end
        res
    end

# a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"


    def my_reverse
        new_arr = []
        i = self.length - 1
        while i >= 0
            new_arr << self[i]
            i -= 1
        end
        new_arr
    end

# p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
# p [ 1 ].my_reverse               #=> [1]

    def bubble_sort!(&prc)
        sorted = false

        while !sorted
            sorted = true
            i = 0
            (0...self.length-2).each do |i|
                if prc.call(self[i]) > prc.call(self[i+1])
                    self[i],self[i+1] = self[i+1],self[i]
                    sorted = false
                end
            end
        end
        self
    end

end

def factors(num)
    (1..num).select {|factor| num % factor == 0}
end


def bubble_sort(&prc)

end 

def substrings(string)
    subs = []
    (0...string.length).each do |first|
        (first...string.length).each do |last|
            subs << string[first..last]
        end
    end
    subs
end

def subwords(word, dictionary)

end


p factors(100)
p substrings('apple')
p [1, 3, 5].bubble_sort! { |num1, num2| num2 <=> num1 }





