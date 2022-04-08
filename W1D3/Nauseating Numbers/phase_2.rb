require "byebug"
def anti_prime?(num)
    return false if is_prime(num)

    divisors = []
    (1..num).each { |number| divisors << number if num % number == 0 }

    i = 2
    current_divisors = []
    bigger_divisors = []
    while i < num
        if !(is_prime(i))
            (1..i).each { |positive| current_divisors << positive if i % positive == 0 }
        end
        bigger_divisors = current_divisors if current_divisors.length > bigger_divisors.length
        current_divisors = []
        i += 1
    end

    if bigger_divisors.length > divisors.length
        return false
    else
        return true
    end
end

def is_prime(num)
    if num < 2
        return false
    end
    
    (2...num).each do |factor|
        if num % factor == 0
            return false
        end
    end
    
    return true
end

# p anti_prime?(24)   # true
# p anti_prime?(36)   # true
# p anti_prime?(48)   # true
# p anti_prime?(360)  # true
# p anti_prime?(1260) # true
# p anti_prime?(27)   # false
# p anti_prime?(5)    # false
# p anti_prime?(100)  # false
# p anti_prime?(136)  # false
# p anti_prime?(1024) # false

def matrix_addition(mx1, mx2)
    total_mx = []
    temp = []

    mx1.each_with_index do |sub, i|
        sub.each_with_index do |ele, j|
            temp << ele + mx2[i][j]
        end
        total_mx << temp
        temp = []
    end

    total_mx
end

# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
# p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
# p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
# p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]

def mutual_factors(*num)
    factors = []
    hsh = Hash.new(0)
    final = []

    num.each do |number|
        (1..number).each { |factor| factors << factor if number % factor == 0 }
    end

    factors.each { |divisors| hsh[divisors] += 1 }

    hsh.each { |k, v| final << k if v >= num_arr.length } 

    final
end

# p mutual_factors(50, 30)            # [1, 2, 5, 10]
# p mutual_factors(50, 30, 45, 105)   # [1, 5]
# p mutual_factors(8, 4)              # [1, 2, 4]
# p mutual_factors(8, 4, 10)          # [1, 2]
# p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
# p mutual_factors(12, 24, 64)        # [1, 2, 4]
# p mutual_factors(22, 44)            # [1, 2, 11, 22]
# p mutual_factors(22, 44, 11)        # [1, 11]
# p mutual_factors(7)                 # [1, 7]
# p mutual_factors(7, 9)              # [1]

def tribonacci_number(n)
    trib = [1, 1, 2]

    return trib[n-1] if n <= 3

    i = 3

    while i < n
        trib << trib[i-1] + trib[i-2] + trib[i-3]
        i += 1
    end

    return trib[n-1]
end

# p tribonacci_number(1)  # 1
# p tribonacci_number(2)  # 1
# p tribonacci_number(3)  # 2
# p tribonacci_number(4)  # 4
# p tribonacci_number(5)  # 7
# p tribonacci_number(6)  # 13
# p tribonacci_number(7)  # 24
# p tribonacci_number(11) # 274

