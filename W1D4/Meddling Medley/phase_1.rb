def duos(str)
    counter = 0

    (1..str.length-1).each_with_index { |i| counter += 1 if str[i] == str[i+1] }

    counter
end

# p duos('bootcamp')      # 1
# p duos('wxxyzz')        # 2
# p duos('hoooraay')      # 3
# p duos('dinosaurs')     # 0
# p duos('e')             # 0

def sentence_swap(sent, hsh)
    sent_arr = sent.split(" ")
    new_sent = []

    sent_arr.each do |word|
        if hsh.has_key?(word)
            new_sent << hsh[word]
        else
            new_sent << word
        end
    end

    new_sent.join(" ")
end

# p sentence_swap('anything you can do I can do',
#     'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
# ) # 'nothing you shall drink I shall drink'

# p sentence_swap('what a sad ad',
#     'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
# ) # 'make a happy ad'

# p sentence_swap('keep coding okay',
#     'coding'=>'running', 'kay'=>'pen'
# ) # 'keep running okay'

def hash_mapped(hsh, prc1, &prc2)
    new_hsh = {}

    hsh.each { |k, v| new_hsh[prc2.call(k)] = prc1.call(v) }

    new_hsh
end

# double = Proc.new { |n| n * 2 }
# p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# # {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

# first = Proc.new { |a| a[0] }
# p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# # {25=>"q", 36=>"w"}

def counted_characters(str)
    arr = []

    str.each_char { |char| arr << char if (str.split("").count { |letter| letter == char} > 2) && (!arr.include?(char)) }

    arr
end

# p counted_characters("that's alright folks") # ["t"]
# p counted_characters("mississippi") # ["i", "s"]
# p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
# p counted_characters("runtime") # []

def triplet_true(str)
    (1..str.length-2).each_with_index { |times, i| return true if str[i] == str[i+1] && str[i] == str[i+2] }

    false

end

# p triplet_true('caaabb')        # true
# p triplet_true('terrrrrible')   # true
# p triplet_true('runninggg')     # true
# p triplet_true('bootcamp')      # false
# p triplet_true('e')             # false

def energetic_encoding(str, hsh)
    new_str = ""

    str.each_char do |char|
        if char == " " 
            new_str += char
        elsif !hsh.has_key?(char)
            new_str += "?"
        else
            new_str += hsh[char]
        end
    end

    new_str
end

# p energetic_encoding('sent sea',
#     'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
# ) # 'zimp ziu'

# p energetic_encoding('cat',
#     'a'=>'o', 'c'=>'k'
# ) # 'ko?'

# p energetic_encoding('hello world',
#     'o'=>'i', 'l'=>'r', 'e'=>'a'
# ) # '?arri ?i?r?'

# p energetic_encoding('bike', {}) # '????'

def uncompress(str)
    new_str = ""

    (1...str.length).each_with_index { |num, i| new_str += str[i] * str[i+1].to_i }

    new_str
end

p uncompress('a2b4c1') # 'aabbbbc'
p uncompress('b1o2t1') # 'boot'
p uncompress('x3y1x2z4') # 'xxxyxxzzzz'