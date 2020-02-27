require "Prime"

def no_dupes?(arr)
    arr.select { |ele| arr.count(ele) == 1 }
end

# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []


def no_consecutive_repeats?(arr)
    i = 0
    while i < arr.length - 1
        return false if arr[i] == arr[i+1]
        i += 1
    end
    true 
end

# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true

def char_indices(str)
    hash = Hash.new { |h, k| h[k] = [] }
    str.each_char.with_index { |char, i| hash[char] << i }
    hash
end

# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

def longest_streak(str)
    hash = {}
    i = 0
    while i < str.length
        new_str = '' 
        count = 0
        current_char = str[i]
        while current_char == str[i]
            new_str += current_char
            count += 1
            i += 1
        end
        hash[new_str] = count
    end
    hash.sort_by{|k,v| v}[-1][0]
end

# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'

def bi_prime?(number) # Hash way is more efficient
    factors = (2...number).select {|factor| number % factor == 0}
    factors.each_with_index do |num1, i1|
        factors.each_with_index do |num2, i2|
            if i1 <= i2 && (Prime.prime?(num1) && Prime.prime?(num2))
                product = num1 * num2
                return true if product == number 
            end
        end
    end
    false
end

# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false

def vigenere_cipher(word, keys)
    alphabet = ("a".."z").to_a
    new_str = ""

    i = 0
    while i < word.length
        key = i % keys.length
        old_idx = alphabet.index(word[i])
        new_idx = (old_idx + keys[key]) % 26
        new_str += alphabet[new_idx]
        i += 1
    end

    new_str
end

# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"

def vowel_rotate(string)
    vowels = "aeiou"
    chars = string.split("")
    hash = {}
    chars.each_with_index do |char, idx|
        if vowels.include?(char) # if current char is a vowel
            hash[idx] = char
        end
    end

    last = hash.keys
    new_arr = hash.keys.unshift(last)
    p new_arr
    p hash.values
end

p vowel_rotate('computer')      # => "cempotur"
# p vowel_rotate('oranges')       # => "erongas"
# vowel_rotate('headphones')    # => "heedphanos"
# vowel_rotate('bootcamp')      # => "baotcomp"
# vowel_rotate('awesome')       # => "ewasemo"
