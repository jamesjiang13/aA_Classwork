def hipsterfy(word)
    vowels = "aeiou"
    
    if word.split("").none? { |char| vowels.include?(char)}
        return word
    end

    arr = word.split("")

    i = word.length - 1 

    while i > 0 
        if vowels.include?(arr[i])
            arr[i] = ""
            break 
        end
        i -= 1
    end

    arr.join("")
end

def vowel_counts(str)
    vowels = "aeiou"
    arr = str.downcase.split("")
    all_vowels = arr.select { |ele| vowels.include?(ele) }
    hash = Hash.new(0)
    all_vowels.each { |vowel| hash[vowel] += 1 }
    hash
end

def caesar_cipher(str, num)
    alphabet = ("a".."z").to_a
    new_str = []
    arr = str.split("")
    
    arr.each_with_index do |ele, i|
        if !alphabet.include?(ele)
            new_str << ele
        else
            old_idx = alphabet.index(ele)
            new_idx = (old_idx + num) % 26
            new_str << alphabet[new_idx]
        end
    end

    new_str.join("")
end