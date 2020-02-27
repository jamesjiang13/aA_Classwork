def all_words_capitalized?(arr)
    arr.all? { |word| word.capitalize == word}
end

def no_valid_url?(arr)
    #urls = "'.com', '.net', '.io', '.org'"
    arr.none? { |site| site.end_with?('.com', '.net', '.io', '.org') }
end

def any_passing_students?(arr) #arr of hashes
    arr.any? do |student|
        avg = student[:grades].sum / student[:grades].length
        avg >= 75
    end
end