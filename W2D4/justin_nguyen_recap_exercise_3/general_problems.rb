def no_dupes?(arr)
    new_hsh = Hash.new(0)
    new_arr = []

    arr.each { |ele| new_hsh[ele] += 1}

    new_hsh.each { |k,v| new_arr << k if v == 1 }

    new_arr
end

# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []

def no_consecutive_repeats?(arr)
    (0...arr.length-1).each { |i| return false if arr[i] == arr[i+1]}

    true
end

# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true

def char_indices(str)
    hsh = Hash.new {|h,k| h[k] = []}

    str.each_char.with_index { |letter, i| hsh[letter] << i }

    hsh
end

# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

def longest_streak(str)
    longest = str[0]
    current = ""
    match = true
    i = 0

    return str if str.length == 1

    while i < str.length - 1
        current = str[i] 
        while match
            if str[i] == str[i+1]
                current += str[i+1]
                i += 1
            elsif current.length < 2
                current = str[i+1]
                match = false
            else
                match = false
            end
        end
        longest = current if current.length >= longest.length
        current = ""
        match = true
        i += 1
    end

    longest
end

# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'

def bi_prime?(num)
    (2...num).each do |num1|
        (2...num).each do |num2|
            return true if (num1*num2 == num) && is_prime(num1) && is_prime(num2)
        end
    end

    false
end

def is_prime(num)
    return false if num < 2

    (2...num).each { |factor| return false if num % factor == 0 }

    true
end

# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false

def vigenere_cipher(message, keys)
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    new_word = ""

    message.each_char do |letter|
        index = alphabet.index(letter)
        new_word += alphabet[((index + keys[0]) % 26)]
        keys.rotate!
    end

    new_word
end

# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"
require "byebug"
def vowel_rotate(str)
    new_str = str[0..-1]
    vowel = "aeiou"
    orig_idx = (0...str.length).select { |i| vowel.include?(str[i])}
    new_idx = orig_idx.rotate(-1)

    orig_idx.each_with_index do |orig_vow_idx, i|
        new_vow = str[new_idx[i]]
        new_str[orig_vow_idx] = new_vow
    end

    new_str

end

p vowel_rotate('computer')      # => "cempotur"
p vowel_rotate('oranges')       # => "erongas"
p vowel_rotate('headphones')    # => "heedphanos"
p vowel_rotate('bootcamp')      # => "baotcomp"
p vowel_rotate('awesome')       # => "ewasemo"