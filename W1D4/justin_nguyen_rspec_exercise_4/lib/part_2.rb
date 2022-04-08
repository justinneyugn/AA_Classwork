def proper_factors(num)
    factors = []

    (1...num).each { |divisors| factors << divisors if num % divisors == 0 }

    factors
end

def aliquot_sum(num)
    proper_factors(num).sum
end

def perfect_number?(num)
    return true if num == aliquot_sum(num)

    false
end

def ideal_numbers(n)
    ideal = []
    index = 1

    while ideal.length < n
        ideal << index if perfect_number?(index)
        index += 1
    end

    ideal
end

