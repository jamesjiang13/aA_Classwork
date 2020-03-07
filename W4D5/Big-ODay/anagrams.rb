def first_anagram?(str1, str2)
  perm1 = str1.chars.permutation.to_a
  perm1.include?(str2.chars)
end

# p first_anagram?("cat", "act")

def second_anagram?(str1, str2) # O(n + m + 2mn) => O(mn)
  chars1 = str1.chars
  chars2 = str2.chars
  
  chars1.each do |char|
    return false if !chars2.include?(char)
    chars2_idx = chars2.find_index(char)
    chars2.delete_at(chars2_idx)
  end
  
  chars2.empty?
end

# p second_anagram?("cats", "act")

# time: O( (n + nlogn) * 2 + [n,m].min ) => O(nlogn)
def third_anagram?(str1,str2)
  str1.chars.sort == str2.chars.sort
end

# p third_anagram?("cat", "act")

# time O(n + m) => O(n) 
def fourth_anagram?(str1,str2) 
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)

  str1.each_char {|char| hash1[char] += 1}  # n 
  str2.each_char {|char| hash2[char] += 1}  # m

  hash1 == hash2 # constant
end

p fourth_anagram?("cat", "act")
p fourth_anagram?("cat", "acts")