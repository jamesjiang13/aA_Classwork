def proper_factors(num)
    (1...num).select { |factor| num % factor == 0}
end

def aliquot_sum(num)
    proper_factors(num).sum
end

def perfect_number?(num)
    num == aliquot_sum(num)
end

def ideal_numbers(n)
    arr = []
    count = 6
    while arr.length < n
        arr << count if perfect_number?(count)
        count += 1
    end
    arr
end