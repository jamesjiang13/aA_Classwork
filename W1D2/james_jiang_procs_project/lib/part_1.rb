def my_map(arr, &blk)
    new_arr = []
    arr.each {|ele| new_arr << blk.call(ele) }
    new_arr
end

def my_select(arr, &blk)
    new_arr = []
    arr.each {|ele| new_arr << ele if blk.call(ele) }
    new_arr
end

def my_count(arr, &blk)
    count = 0
    arr.each {|ele| count += 1 if blk.call(ele) }
    count
end

def my_any?(arr, &blk)
    count = 0
    arr.each {|ele| count += 1 if blk.call(ele) }
    count > 0 ? true : false
end

def my_all?(arr, &blk)
    count = 0
    arr.each {|ele| count += 1 if blk.call(ele) }
    count == arr.length ? true : false 
end

def my_none?(arr, &blk)
    count = 0
    arr.each {|ele| count += 1 if blk.call(ele) }
    count == 0 ? true : false
end