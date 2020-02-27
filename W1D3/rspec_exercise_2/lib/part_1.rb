def partition(arr, num)
    lower = []
    upper = []
    arr.each { |ele| ele >= num ? upper << ele : lower << ele }
    [lower, upper]
end

def merge(hash1, hash2)
    hash1.merge(hash2)
end

def censor(sentence, curses)
    vowels = 'aeiou'

    words = sentence.split(" ")
    words.map! do |word|
        if curses.include?(word.downcase)
            new_word = word.chars.map do |char| 
                vowels.include?(char.downcase) ? "*" : char
            end
            new_word.join("")
        else
            word
        end
    end
    words.join(" ")
end

def power_of_two?(num)
    while num > 2
        if num % 2 != 0
            return false
        end
        num = num / 2
    end
    true
end
