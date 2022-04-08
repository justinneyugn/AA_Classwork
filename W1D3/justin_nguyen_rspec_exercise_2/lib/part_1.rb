def partition(arr, num)
    arr1 = []
    arr2 = []

    arr.each do |number|
        if number < num
            arr1 << number
        else
            arr2 << number
        end
    end
    [arr1, arr2]
end

def merge(hsh1, hsh2)
    hsh = Hash.new(0)
    first_hash = hsh1
    second_hash = hsh2

    first_hash.each { |letter, num| hsh[letter] = num if !(hsh.has_key?(letter)) }

    second_hash.each { |letter, num| hsh[letter] = num }
    hsh
end

 def censor(sent, arr)
    sent_arr = sent.split(" ")
    vowel = "aeiou"
    new_word = ""
    new_word_arr = []

    sent_arr.each do |word|
        if arr.include?(word.downcase)
            word.each_char do |letter|
                if vowel.include?(letter.downcase)
                    new_word += "*"
                else
                    new_word += letter
                end
            end
            new_word_arr << new_word
            new_word = ""
        else
            new_word_arr << word
        end
    end
    new_word_arr.join(" ")
 end
require "byebug"

 def power_of_two?(num)
    (0...num).each { |number| return true if 2**number == num }

    false
 end

