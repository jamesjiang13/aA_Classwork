def select_even_nums(arr)
    arr.select(&:even?)
end

def reject_puppies(arr) #arr of hashes
    arr.reject { |dog| dog["age"] <= 2 }
end

def count_positive_subarrays(arr)
    arr.count { |sub_arr| sub_arr.sum > 0}
end

def aba_translate(str)
    vowels = 'aeiou'

    str.split("").map! { |ele| (vowels.include?(ele))? 
        (ele + 'b' + ele) : ele }.join("")
end

def aba_array(arr)
    arr.map { |word| aba_translate(word)}
end
