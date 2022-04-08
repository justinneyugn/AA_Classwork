def is_prime?(num)
    return false if num < 2

    (2...num).each { |factor| return false if num % factor == 0 }

    true
end

def nth_prime(num)
    primes = []
    number_checked = 2

    while primes.length < num
        primes << number_checked if is_prime?(number_checked)
        number_checked += 1
    end

    primes[-1]
end

def prime_range(min, max)
    primes = []

    (min..max).each { |num| primes << num if is_prime?(num) }

    primes
end


