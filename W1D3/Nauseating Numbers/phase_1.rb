def strange_sums(arr)
    count = 0

    arr.each_with_index do |num1, idx1|
        arr.each_with_index { |num2, idx2| count += 1 if idx2 > idx1 && num1 + num2 == 0 } 
    end
    count
end

# p strange_sums([2, -3, 3, 4, -2])
# p strange_sums([42, 3, -1, -42])
# p strange_sums([-5, 5])
# p strange_sums([19, 6, -3, -20])
# p strange_sums([9])

def pair_product(arr, prod)
    arr.each_with_index do |num1, idx1|
        arr.each_with_index { |num2, idx2| return true if idx1 != idx2 && num1 * num2 == prod }
    end

    false
end

# p pair_product([4, 2, 5, 8], 16)    # true
# p pair_product([8, 1, 9, 3], 8)     # true
# p pair_product([3, 4], 12)          # true
# p pair_product([3, 4, 6, 2, 5], 12) # true
# p pair_product([4, 2, 5, 7], 16)    # false
# p pair_product([8, 4, 9, 3], 8)     # false
# p pair_product([3], 12)             # false

def rampant_repeats(str, hsh)
    new_str = ""

    str.each_char do |letter|
        if hsh.has_key?(letter)
            new_str += letter * hsh[letter]
        else
            new_str += letter
        end
    end
    new_str
end

# p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
# p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
# p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
# p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'

def perfect_square(num)
    return true if (1..num).any? {|number| number * number == num}

    false
end

# p perfect_square(1)     # true
# p perfect_square(4)     # true
# p perfect_square(64)    # true
# p perfect_square(100)   # true
# p perfect_square(169)   # true
# p perfect_square(2)     # false
# p perfect_square(40)    # false
# p perfect_square(32)    # false
# p perfect_square(50)    # false

