def zip(*arr)
    res = []
    (0...arr[0].length).each do |i|
        temp = []
        arr.each do |sub|
            temp << sub[i]
        end
        res << temp
    end
    res
end

def prizz_proc(arr, prc1, prc2)
    res = []
    arr.each do |ele|
        if (prc1.call(ele) && !prc2.call(ele)) || (!prc1.call(ele) && prc2.call(ele))
            res << ele
        end
    end
    res
end


def zany_zip(*arr)
    max_length = arr.inject(0) {|acc, sub| acc > sub.length ? acc : sub.length}
    res = []
    (0...max_length).each do |i|
        temp = []
        arr.each do |sub|
            temp << sub[i]
        end
        res << temp
    end
    res
end

def maximum(arr, &prc)
    return nil if arr.length == 0
    res = arr[0]

    arr.inject(prc.call(arr[0])) do |acc, ele|
        if prc.call(ele) >= acc
            res = ele
            prc.call(ele)
        else
            acc
        end
    end
    res
end


def my_group_by(arr, &prc)

    hash = {}
    arr.each do |ele|
        key = prc.call(ele)               
        if hash.has_key?(key)
            hash[key] << ele
        else
            hash[key] = [ele] 
        end
    end
    hash
end

def max_tie_breaker(arr, prc, &blk)
    return nil if arr.length == 0

    res = arr[0]

    arr.inject(blk.call(arr[0])) do |acc, ele|                   
        if blk.call(ele) > acc
            res = ele
            blk.call(ele)
        elsif blk.call(ele) == acc
            if prc.call(ele) > acc
                prc.call(ele)
            else
                acc
            end
        else
            acc
        end
    end
    res
end


def silly_syllables(str)
    str.split(" ").map {|word| remove_letters(word)}.join(" ")
end


def remove_letters(word)
    vowels = "aeiou"
    last = 0
    first = 0
    return word if word.count(vowels) < 2   
    chars = word.split("")
    i = word.length-1
    while i >=0

        if vowels.include?(chars[i])
            last = i
            break
        end
        i-=1
    end

    chars.each do |letter|

        if vowels.include?(letter)
            first = chars.index(letter)
            break
        end
    end
    
    word[first..last]

end
