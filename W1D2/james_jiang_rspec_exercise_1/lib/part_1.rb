def average (num1, num2)
    return (num1 + num2) / 2.0
end

def average_array(arr)
    arr.sum / (arr.length * 1.0)
end

def repeat(str, num)
    new_str = str * num
end

def yell(str)
    str.upcase + "!"
end

def alternating_case(str)
    array = str.split(" ")
    new_array = []

    array.each_with_index do |ele, idx|
        if idx.even?
            new_array << ele.upcase
        else
            new_array << ele.downcase
        end
    end

    new_array.join(" ")
end