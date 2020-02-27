# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(num)
    num.downto(3).each do |factor|
        return factor if num % factor == 0 && prime?(factor)
    end
end

def prime?(num)
    return false if num < 2
    (2...num).none? { |i| num % i == 0 }
end

def unique_chars?(str)
    str.split("").uniq == str.split("")
end

def dupe_indices(arr)
    hash = Hash.new { |h,k| h[k] = [] }
    arr.each_with_index {} |ele, idx| hash[ele] << idx }
    hash.select { |k,v| v.length > 1 }
end

def ana_array(arr_1, arr_2)
    arr_to_hash(arr_1) == arr_to_hash(arr_2)
end

def arr_to_hash(arr)
    hash = Hash.new(0)
    arr.each { |ele| hash[ele] += 1}
    hash
end