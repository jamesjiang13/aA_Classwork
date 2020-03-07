
# time O(n^2)
def bad_two_sum?(arr, target_sum)
  arr.each_with_index do |ele1, i1|
    arr.each_with_index do |ele2, i2|
      return true if ele1 + ele2 == target_sum && i2 > i1
    end
  end
  false
end

arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

# time : nlogn + nlogn => nlogn
def okay_two_sum?(arr, target_sum)
  sorted = arr.sort   # nlogn
  sorted.length.times do 
    first = sorted.shift  
    return true if sorted.bsearch {|value| target_sum - first <=> value } #logn
  end
  false
end

# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false



# time O(n)
def two_sum?(arr, target_sum)
  hash = Hash.new(false)
  arr.each do |ele|
    return true if hash[target_sum - ele]
    hash[ele] = true
  end
  false
end

p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false
