# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]
def all_vowel_pairs(words)
    vowel = "aeiou"
    new_arr = []

    words.each_with_index do |word1, idx1|
        words.each_with_index do |word2, idx2|
            if idx2 > idx1
                combined = word1 + " " + word2
                hsh = { "a" => 0, "e" => 0, "i" => 0, "o" => 0, "u" => 0 }
                combined.each_char { |letter| hsh[letter] += 1 if vowel.include?(letter) }
                new_arr << combined if !hsh.has_value?(0)
            end
        end
    end

    new_arr
end


# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)
    (2...num).each { |factor| return true if num % factor == 0 }

    false
end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
    bigrams_arr = []

    bigrams.each { |bigram| bigrams_arr << bigram if str.include?(bigram)}

    bigrams_arr
end

class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)
        new_hsh = {}
        prc ||= Proc.new { |key, value| key == value}

        self.each do |k, v|
            new_hsh[k] = v if prc.call(k,v)
        end

        new_hsh
    end
end

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    def substrings(length = nil)
        str_arr = []
        substring = ""
        new_arr = []

        self.each_char.with_index do |letter, i|
            self.each_char.with_index do |letter2, j|
                if j >= i
                    substring = self[i..j]
                    str_arr << substring
                end
            end
        end

        if length
            str_arr.each { |sub| new_arr << sub if sub.length == length}
            return new_arr
        end

        str_arr
    end


    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)
        alphabet = "abcdefghijklmnopqrstuvwxyz"
        new_str = ""

        self.each_char do |letter|
            i = alphabet.index(letter)
            new_str += alphabet[(i+num) % 26]
        end

        new_str
    end
end
