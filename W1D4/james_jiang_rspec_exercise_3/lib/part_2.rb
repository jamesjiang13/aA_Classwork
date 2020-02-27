def element_count(array)
    count = Hash.new(0)
    array.each { |ele| count[ele] += 1}
    count
end

def char_replace!(str, hash)
    str.each_char.with_index { |char, index| str[index] = hash[char] if hash[char] }
    str
end

def product_inject(array)
    array.inject { |acc, el| acc * el }
end