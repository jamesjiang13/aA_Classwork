def palindrome?(string)
    rev_string = []
    string.each_char {|char| rev_string.unshift(char)}
    rev_string.join("") == string
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

def palindrome_substrings(string)
    sub_strings = substrings(string)
    sub_strings.select {|ele| palindrome?(ele) && ele.length > 1 }
end
