def my_reject(arr, &prc)
    new_arr = []
    arr.each{|ele| new_arr << ele if !prc.call(ele) }
    new_arr
end

def my_one?(arr, &prc)
    count = 0
    arr.each { |ele| count += 1 if prc.call(ele) }
    count == 1 ? true : false
end

def hash_select(hash, &prc)
    new_hash = {}
    hash.each {|key, value| new_hash[key] = value if prc.call(key, value) }
    new_hash
end

def xor_select(arr, prc_1, prc_2)
    new_array = []
    arr.each do |ele|
        new_array << ele if (prc_1.call(ele) && !prc_2.call(ele)) || (prc_2.call(ele) && !prc_1.call(ele))
    end
    new_array
end

def proc_count(value, array)
    count = 0
    array.each {|procs| count += 1 if procs.call(value) }
    count
end
