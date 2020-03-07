
# time complexity: O(n^2)
# def my_min(array)
#   array.each do |ele|
#     return ele if array.all?{|ele2| ele <= ele2}
#   end 
# end

# O(n)
def my_min(array)
  min = nil
  array.each do |ele|
    min = ele if !min || ele < min
  end
  min
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5

# time: O(n^3 + n^2)
# def largest_contiguous_subsum(array)
#   all_subs = []
#   array.each_with_index do |ele1, i|    
#     array.each_with_index do |ele2,j|     # total n^2 for next loops
#       all_subs << array[i..j].sum if j >= i   # O(n) 
#     end    
#   end
#   all_subs.max    # 2n elements, O(n) 
# end

def largest_contiguous_subsum(array)
  largest_sum = nil
  current_sum = 0
  
  array.each do |ele|
    current_sum = 0 if current_sum < 0
    current_sum += ele

    if !largest_sum || current_sum > largest_sum 
      largest_sum = current_sum
    end

  end
  largest_sum
end

list = [5, 3, -7]
p largest_contiguous_subsum(list) # => 8

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

list = [-5, -1, -3]
p largest_contiguous_subsum(list) # => -1 (from [-1])

["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"] #first
["z", "z", "y", "x", "w", "v", "u", "t", "s", "r", "q", "p", "o", "n", "m", "l", "k", "j", "i", "h", "g", "f", "e", "d", "c", "b", "a"] #second
