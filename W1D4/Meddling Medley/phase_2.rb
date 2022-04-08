def conjunct_select(arr, *prcs)
    new_arr = []
    counter = 0

    arr.each do |num|
        prcs.each { |prc| counter += 1 if prc.call(num) }
        new_arr << num if counter == prcs.length
        counter = 0
    end

    new_arr
end

# is_positive = Proc.new { |n| n > 0 }
# is_odd = Proc.new { |n| n.odd? }
# less_than_ten = Proc.new { |n| n < 10 }

# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]

def convert_pig_latin(sent)
    sent_arr = sent.split(" ")
    new_word = ""
    vowel = "aeiou"

    new_sent = sent_arr.map do |word|
        if word.length < 3
            word
        elsif vowel.include?(word[0].downcase)
            word + "yay"
        else
            word.each_char.with_index do |letter, i| 
                if vowel.include?(letter) 
                    new_word = word[i].upcase + word[i+1..-1].downcase + word[0...i].downcase + "ay"
                    break
                end
            end
            new_word
        end
    end

    new_sent.join(" ")
end

# p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
# p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
# p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
# p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
# p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"

def reverberate(sent)
    sent_arr = sent.split(" ")
    new_word = ""
    vowel = "aeiou"

    new_sent = sent_arr.map do |word|
        if word.length < 3
            word
        elsif vowel.include?(word[-1])
            word + word.downcase
        else
            word.each_char.with_index { |letter, i| new_word = word + word[i..-1] if vowel.include?(letter) }
            new_word
        end
    end

    new_sent.join(" ")
end

# p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
# p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
# p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
# p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"

def disjunct_select(arr, *prcs)
    new_arr = []

    arr.each { |word| new_arr << word if prcs.any? {|prc| prc.call(word)} }

    new_arr
end

# longer_four = Proc.new { |s| s.length > 4 }
# contains_o = Proc.new { |s| s.include?('o') }
# starts_a = Proc.new { |s| s[0] == 'a' }

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
# ) # ["apple", "teeming"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o
# ) # ["dog", "apple", "teeming", "boot"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o,
#     starts_a
# ) # ["ace", "dog", "apple", "teeming", "boot"]

def alternating_vowel(sent)
    sent_arr = sent.split(" ")
    new_word = ""
    new_sent = []
    reversed = ""
    vowel = "aeiou"
    has_vowel = false

    sent_arr.each_with_index do |word, i|
        if i % 2 == 0
            word.each_char.with_index do |letter, idx|
                if vowel.include?(letter)
                    new_sent << word[0...idx] + word[idx+1..-1]
                    has_vowel = true
                    break
                end
            end
            new_sent << word if !has_vowel
        else
            reversed = word.reverse
            reversed.each_char.with_index do |letter, idx|
                if vowel.include?(letter)
                    new_word = reversed[0...idx] + reversed[idx+1..-1]
                    has_vowel = true
                    break
                end
            end
            if has_vowel
                new_sent << new_word.reverse
            else
                new_sent << word
            end
        end
        has_vowel = false
    end

    new_sent.join(" ")
end

# p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
# p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
# p alternating_vowel('code properly please') # "cde proprly plase"
# p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"

def silly_talk(sent)
    sent_arr = sent.split(" ")
    vowel = "aeiou"
    new_word = ""

    new_sent = sent_arr.map do |word|
        if vowel.include?(word[-1])
            word + word[-1]
        else
            new_word = ""
            word.each_char do |letter|
                if vowel.include?(letter)
                    new_word += letter + "b" + letter
                else
                    new_word += letter
                end
            end
            new_word
        end
    end
    new_sent.join(" ")
end

# p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
# p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
# p silly_talk('They can code') # "Thebey caban codee"
# p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"

def compress(string)
    compressed = ''
    letters = ('a'..'z').to_a
    i = 0
    while i < string.length
        char = string[i]
        count = 1
        i += 1
        while char == string[i]
            count += 1
            i += 1
        end

        if count > 1
            compressed += char + count.to_s
        else
            compressed += char
        end
    end

    compressed
end

# p compress('aabbbbc')   # "a2b4c"
# p compress('boot')      # "bo2t"
# p compress('xxxyxxzzzz')# "x3yx2z4"