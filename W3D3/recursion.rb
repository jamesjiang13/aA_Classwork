require 'byebug'
# MAX_STACK_SIZE = 200
# tracer = proc do |event|
#   if event == 'call' && caller_locations.length > MAX_STACK_SIZE
#     fail "Probable Stack Overflow"
#   end
# end
# set_trace_func(tracer)


# Warmup
# Write a recursive method, range, that takes a start and an end and returns an array
# of all numbers in that range, exclusive. For example, range(1, 5) should return [1, 2, 3, 4].
#  If end < start, you can return an empty array.

# Write both a recursive and iterative version of sum of an array.

def range(start, last)
    return [] if last <= start
    return [start] if start == last - 1

    [start] + range(start + 1, last)
end

# p range(1, 10)
# p range(2, 5)
# p range(9, 20)
# p range(2, 2)

def range_sum_recursive(arr)
    return nil if arr.empty?
    return arr[0] if arr.length == 1

    arr[0] + range_sum_recursive(arr[1..-1])
end

# p range_sum_recursive([1,2,3,4,5,6])

def range_sum(arr)
    arr.inject {|acc, el| acc + el}
end

# p range_sum([1,2,3,4,5,6])

def exp1(num, power) 
    return 1 if power == 0
    num * exp1(num, power - 1)
end

# p exp1(1,0)
# p exp1(1,1)
# p exp1(2,1)
# p exp1(2,2)

def exp2(num, power)
    return 1 if power == 0
    return num if power == 1
    if power.even?
        part = exp2(num, power / 2) 
        part * part
    else    
        part_odd = exp2(num, (power - 1) / 2)
        num * part_odd * part_odd
    end
end

# p exp2(1,0)
# p exp2(1,1)
# p exp2(2,1)
# # p exp2(2,4)
# p exp2(3,3)
# # p exp2(5,3)
# p exp2(3,2)

def retire_money(your_age)
    bank_account = (your_age / 2)**2
    years_left = (65 - (your_age / 2))
    bank_account * years_left
end

# p retire_money(30)
# p retire_money(50)

def deep_dup(array)
    return [] if array.length == 0
    return [array[0]] if array.length == 1

    new_array = []
    array.each do |ele|
        if ele.kind_of?(Array)
            new_array << deep_dup(ele)
        else
            new_array << ele 
        end 
    end
    new_array
end

# p deep_dup([1, [2], [3, [4]]])

def fibonacci_recursive(n)
    return [0] if n == 0
    return [0, 1] if n == 1
    return [0,1,1] if n == 2
    # fibs = [0,1,1]
    # debugger
    prev = fibonacci_recursive(n-1)
    # prev_2 = fibonacci_recursive(n-2)
    prev += [(prev[-1] + prev[-2])]      # problem with the +=, changed to <<
    # fibs
end

def fibonacci_iterative(n)
    return [0] if n == 0
    return [0, 1] if n == 1
    return [0, 1, 1] if n == 2
    fibs = [0, 1, 1]
    while fibs.length != n
        first = fibs[-1]
        last = fibs[-2]
        fibs += [first + last]
    end
    fibs
end

# p fibonacci_recursive(7)
# p fibonacci_iterative(3)
# p "----"
# p fibonacci_recursive(4)
# p fibonacci_iterative(4)
# p "-----"
# p fibonacci_recursive(5)
# p fibonacci_iterative(5)
# p "-----"
# p fibonacci_recursive(10)
# p fibonacci_iterative(10)


def bsearch(nums, target)
    # debugger
    mid_idx = nums.length / 2
    left = nums[0...mid_idx]
    right = nums[mid_idx+1..-1]

    return mid_idx if nums[mid_idx] == target       # base case
    return nil if nums[mid_idx] != target && (left.empty? && right.empty?)

    return bsearch(left, target) if target < nums[mid_idx]
    right_search = bsearch(right, target)
    return nil if right_search == nil
    return mid_idx + 1 + right_search if target > nums[mid_idx]
end


def bsearch_it(nums, target)
    return nil if nums.all?{|n| n != target}
    mid_idx = nums.length / 2
    return mid_idx if nums[mid_idx] == target
    nums.each_with_index {|n, i| return i if n == target}
end


# p bsearch([1, 2, 3], 1) # => 0              .length = 3
# p bsearch([2, 3, 4, 5], 3) # => 1           .length = 4
# p bsearch([2, 4, 6, 8, 10], 6) # => 2       .length = 5
# p bsearch([1, 3, 4, 5, 9], 5) # => 3        .length = 5
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5     .length = 6
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

# p bsearch_it([1, 2, 3], 1) # => 0              .length = 3
# p bsearch_it([2, 3, 4, 5], 3) # => 1           .length = 4
# p bsearch_it([2, 4, 6, 8, 10], 6) # => 2       .length = 5
# p bsearch_it([1, 3, 4, 5, 9], 5) # => 3        .length = 5
# p bsearch_it([1, 2, 3, 4, 5, 6], 6) # => 5     .length = 6
# p bsearch_it([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch_it([1, 2, 3, 4, 5, 7], 6) # => nil

def merge(arr_1, arr_2)
    return arr_1 if arr_2.empty?
    return arr_2 if arr_1.empty?

    sorted = []
    if arr_1[0] > arr_2[0]
        sorted += [arr_2[0]]
        arr_2.shift
    else
        sorted += [arr_1[0]]
        arr_1.shift    
    end    
    sorted += merge(arr_1, arr_2)
end

def merge_sort(arr)
    return arr if arr.length <= 1 
    # debugger

    mid_idx = arr.length/2
    first_half = arr[0...mid_idx]
    second_half = arr[mid_idx..-1]

    if first_half.length == 1 && second_half.length == 1
        return merge(first_half, second_half) 
    end

    first_sort = merge_sort(first_half)
    second_sort = merge_sort(second_half)
end

p merge_sort([27, 38, 45, 3, 30, 11])
# output [3, 11, 27, 30, 38, 45]



# [38]    [27]      [43]      [3]
#     [27, 38]         [3, 43]
#         [3, 27, 38, 43]

# arr_1 = [27, 38, 45]
# arr_2 = [3, 11, 30]
# p merge(arr_1, arr_2)
