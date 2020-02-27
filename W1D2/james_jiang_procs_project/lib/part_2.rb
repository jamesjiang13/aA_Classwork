def reverser(str, &blk)
    blk.call(str.reverse)
end

def word_changer(sent, &blk)
    sent.split(" ").map! {|word| blk.call(word) }.join(" ")
end

def greater_proc_value(num, prc1, prc2)
    prc1.call(num) > prc2.call(num) ? prc1.call(num) : prc2.call(num)
end

def and_selector(arr, prc1, prc2)
    arr.select {|ele| prc1.call(ele) && prc2.call(ele) }
end

def alternating_mapper(arr, prc1, prc2)
    arr.map.with_index do |ele, idx|
        if idx.even?
            prc1.call(ele)
        else
            prc2.call(ele)
        end
    end
end