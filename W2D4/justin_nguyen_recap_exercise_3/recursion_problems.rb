def multiply(a, b)
    return 0 if b == 0

    if a < 0 && b < 0
        a *= -1
        b *= -1
    end

    if a > 0 && b < 0
        b *= -1
        return (a + multiply(a, (b-1))) * -1
    elsif a < 0 && b > 0
        a *= -1
        return (a + multiply(a, b-1)) * -1
    else
        return a + multiply(a,b-1)
    end
end

# p multiply(3, 5)        # => 15
# p multiply(5, 3)        # => 15
# p multiply(2, 4)        # => 8
# p multiply(0, 10)       # => 0
# p multiply(-3, -6)      # => 18
# p multiply(3, -6)       # => -18
# p multiply(-3, 6)       # => -18

def lucas_sequence(length)
    if length == 0
        return []
    elsif length == 1
        return [2]
    elsif length == 2
        return [2, 1]
    else
        arr = lucas_sequence(length-1)
        arr << arr[-1] + arr[-2]
        return arr
    end

end

# p lucas_sequence(0)   # => []
# p lucas_sequence(1)   # => [2]    
# p lucas_sequence(2)   # => [2, 1]
# p lucas_sequence(3)   # => [2, 1, 3]
# p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
# p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]

def prime_factorization(num)
    (2...num).each do |factor|
        if num % factor == 0
            other_fact = num / factor
            return [*prime_factorization(factor), *prime_factorization(other_fact)]
        end
    end

    [num]
end

# p prime_factorization(12)     # => [2, 2, 3]
# p prime_factorization(24)     # => [2, 2, 2, 3]
# p prime_factorization(25)     # => [5, 5]
# p prime_factorization(60)     # => [2, 2, 3, 5]
# p prime_factorization(7)      # => [7]
# p prime_factorization(11)     # => [11]
# p prime_factorization(2017)   # => [2017]
