require 'Prime'

def is_prime?(num)
    return false if num < 2
    (2...num).each {|n| return false if num % n == 0}
    true
end

def nth_prime(n)
    primes = []
    num = 1
    while primes.length != n
        primes << num if is_prime?(num)
        num += 1
    end
    primes[-1]
end

def prime_range(min, max)
    primes = []
    (min..max).each {|num| primes << num if is_prime?(num)}
    primes
end