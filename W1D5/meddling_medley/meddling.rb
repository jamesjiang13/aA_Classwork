def duos(str)
    count = 0
    (0...str.length-1).each do |i|
        count += 1 if str[i] == str[i+1]
    end
    count
end    



def sentence_swap(str, hash)
    new_sent = []
    str.split(" ").each do |word|

        if hash.has_key?(word)
            new_sent << hash[word]
        else
            new_sent << word
        end
    end

    new_sent.join(" ")
end


def hash_mapped(hash, prc, &blk)
    new_hash = {}
    hash.each do |k,v|
        new_hash[blk.call(k)] = prc.call(v)
    end
    new_hash
end


def counted_characters(str)
    res = []
    str.each_char do |char|             
       if str.count(char) > 2 && !res.include?(char)
            res << char
       end
    end
    res

end

def triplet_true(str)
    (0..str.length-3).each do |i|
        if str[i] == str[i+1] && str[i] == str[i+2]
            return true
        end
    end
    false
end #return bool


def energetic_encoding(str, hash)
    res = ""
    str.each_char do |char|

        if hash[char] != nil && char != " "
            res += hash[char]
        elsif char == " "
            res += " "
        else
            res += "?"
        end
      
    end

    res
end



def uncompress(str)
    res = ''
    i = 0
    while i < str.length - 1 
        res += str[i] * str[i+1].to_i
        i += 2
    end
    res
end

def conjunct_select(arr, *arr_prcs)

    arr.select do |ele|

        arr_prcs.all? {|prc| prc.call(ele)}

    end

end

def convert_pig_latin(sentence)
    res = []
    words = sentence.split(" ") 
    words.each do |word|
        if word.length < 3
            res << word
        else
            res << latinize(word)
        end
    end
    res.join(" ")
end

def latinize(word)
    vowels = 'aeiou'

    if vowels.include?(word[0].downcase)
        return word + 'yay'
    end

    i = 0
    while i < word.length
        if vowels.include?(word[i].downcase) && word[0].upcase == word[0]
            return word[i..-1].capitalize + word[0...i].downcase + 'ay'
        elsif vowels.include?(word[i].downcase)
            return word[i..-1] + word[0...i].downcase + 'ay'
        end
        i += 1
    end
end


def reverberate(sentence)
   res = []
   words = sentence.split(" ")
   
   words.each do |word|
        if word.length < 3
            res << word
        else
            res<< reverb(word)
        end

   end
   res.join(" ")
end


def reverb(word)
    vowels = "aeiou"
    if vowels.include?(word[-1]) && word[0].upcase == word[0]
        return (word*2).capitalize
    elsif vowels.include?(word[-1])
        return word*2
    end
    i = word.length-1
    while i >=0
        if vowels.include?(word[i])
            return word + word[i..-1]
        end
        i-=1
    end
end

def disjunct_select(arr, *prcs)
    arr.select { |word| prcs.any? {|prc| prc.call(word)} }
end

$vowels = "aeiou"

def alternating_vowel(sentence)

    res = []
    words = sentence.split(" ")

    words.each_with_index do |word, i|
        if word.split("").none? {|char| $vowels.include?(char)}
            res << word
        elsif i.even?
            res <<first_vowel(word)
          #  p "got to first vowel"
        else
           #  p "got to last vowel"
            res << last_vowel(word)
        end
        

    end

    res.join(" ")

end


def first_vowel(word)

    word.each_char.with_index do |char, i|
        if $vowels.include?(char)
            return word[0...i] + word[i+1..-1]
        end
    end
    
end

def last_vowel(word)
    i= word.length-1
    while i >= 0
        if $vowels.include?(word[i])
            return word[0...i] + word[i+1..-1]
        end
        i-=1
    end
end


def silly_talk(sentence)
    words = sentence.split(" ")
    new_arr = []
    words.each do |word|
        # index = $vowels.index(word[-1])
        # if index != nil
        #     return word + $vowels[index]
        # end
        if $vowels.include?(word[-1])
            new_arr << word + word[-1]
        else 
            new_arr << add_b(word)
        end
    end
    new_arr.join(" ")
end

def add_b(word)
    res = ''
    word.each_char do |char|
        if $vowels.include?(char.downcase)
            res += char + "b" + char.downcase
        else
            res += char
        end
    end
    res
end


def compress(str)
    new_str = ""
    j = 0
    while j < str.length
        count = 1
        while str[j] == str[j+1]
            count +=1
            j+=1
        end

        if count != 1
            new_str += str[j] + count.to_s
        else
            new_str += str[j]
        end
        j+=1
    end

    new_str

end

