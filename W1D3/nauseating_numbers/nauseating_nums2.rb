def anti_prime?(num)
    max = 0
    (2..num).each do |i|
        if num_divisors(i) > max && i == num 
            return true
        elsif num_divisors(i) > max
            max = num_divisors(i)
        end
    end
    false
end

def num_divisors(num)
    counts = 0
    (2...num).each do |i|
        counts += 1 if num % i == 0 
    end
    counts
end

# ([[2,5], [4,7]] , [[9,1], [3,0]])
def matrix_addition(matrix_1, matrix_2)
    res = []
    matrix_1.each_with_index do |sub_arr, i|
       first = sub_arr[0] + matrix_2[i][0]
       second = sub_arr[1] + matrix_2[i][1]
       res << [first,second]
    end

    res

end


def mutual_factors(*nums)
    res = []
    (1..nums.min).each do |i|
        res << i if nums.all? { |n| n % i == 0 }
    end
    res
end


def tribonacci_number(n)

    tribs = [1,1,2]
    if n < 4
        return tribs[n-1]
    end

    while tribs.length != n
        tribs << tribs[-1] +  tribs[-2] + tribs[-3]
    end

    tribs[-1]

end


def matrix_addition_reloaded(*matrices)
    res = []
    length = matrices[0].length
    length_sub = matrices[0][0].length
    return nil if !matrices.all? { |matrix| matrix.length == length && matrices.all? {|matrix2| length_sub == matrix2[0].length } }
    
    (0...length).each do |i|             
        first = 0
        second = 0
        matrices.each do |matrix|
            first += matrix[i][0]   
            second += matrix[i][1]
        end
        res << [first,second]
    end

    res 
end


def squarocol?(arr)

    return true if arr.any? {|sub| sub.all? { |ele| ele == sub[0] } }

    (0...arr[0].length).each do |i|
       return true if arr.all? { |sub| sub[i] == arr[0][i] }   
    end

    false
end


def squaragonal?(arr)
    i = 0
    flag = true

    #check upper left to lower right
    while i < arr.length
        if arr[i][i] != arr[0][0]
            flag = false
        end
        i += 1
    end
    return flag if flag == true

    #check lower left to upper right
    i = 0
    j = arr[0].length-1
    while j >= 0
        if arr[i][j] != arr[0][-1]
            return false
        end
        i += 1
        j -= 1
    end

    true
end


def pascals_triangle(n)
    return [[1]] if n==1
    triangle = [[1],[1,1]]

    while triangle.length !=n
        triangle << next_level(triangle[-1])
    end

    triangle

end



def next_level(prev_level)
    
    next_level = []
    i=0
    while i < prev_level.length-1
        next_level << prev_level[i] + prev_level[i+1]
        i+=1
    end
    next_level.unshift(1)
    next_level.push(1)

    next_level
end


def mersenne_prime(num)
    mers = []
    i = 2
    while mers.length != num
        if isprime?(i) && pwr2?(i+1) 
            mers << i
        end
        i += 1
    end
    mers[-1]
end

def isprime?(num)
    return false if num < 2 
    (2...num).each {|i| return false if num % i == 0 }     
    true
end

def pwr2?(num)
    power2 = 1
    while power2 <= num
        power2 *= 2
        return true if power2 == num
    end
    false
end




def pretentious_primes(arr, n)
    primes = []

    if n > 0
        arr.each do |num|
            next_primes = []
            i = num+1
            while next_primes.length < n
                if isprime?(i)
                    next_primes << i
                end
                i+=1
            end
            primes << next_primes[-1]
        end
    else
        arr.each do |num|
            neg_primes = []
            i = num-1
            size = (-1) * n
            while (neg_primes.length != size && i>=0)

                if isprime?(i)
                    neg_primes << i
                end
                i-=1
            end   
           
             if neg_primes.length == n*-1  
                primes << neg_primes[-1]   
            else 
                primes << nil
            end
        end
    end

    primes
end


#p pretentious_primes([4, 15, 7], 1)           # [5, 17, 11]
#  p pretentious_primes([4, 15, 7], 2)           # [7, 19, 13]
#  p pretentious_primes([12, 11, 14, 15, 7], 1)  # [13, 13, 17, 17, 11]
#  p pretentious_primes([12, 11, 14, 15, 7], 3)  # [19, 19, 23, 23, 17]
# p pretentious_primes([4, 15, 7], -1)          # [3, 13, 5]
 p pretentious_primes([4, 15, 7], -2)          # [2, 11, 3]
 p pretentious_primes([2, 11, 21], -1)         # [nil, 7, 19]
 p pretentious_primes([32, 5, 11], -3)         # [23, nil, 3]
 p pretentious_primes([32, 5, 11], -4)         # [19, nil, 2]
 p pretentious_primes([32, 5, 11], -5)         # [17, nil, nil]