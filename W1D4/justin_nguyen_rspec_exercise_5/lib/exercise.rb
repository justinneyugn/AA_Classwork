def zip(*arr)
    new_arr = []
    temp_arr = []

    (1..arr[0].length).each_with_index do |sub, i|
        (1..arr.length).each_with_index do |ele, j|
            temp_arr << arr[j][i]
        end
        new_arr << temp_arr
        temp_arr = []
    end

    new_arr

end

def prizz_proc(arr, prc1, prc2)
   new_arr = []

   arr.each { |ele| new_arr << ele if (prc1.call(ele) || prc2.call(ele)) && (!(prc1.call(ele) && prc2.call(ele))) }

   new_arr
end

def zany_zip(*arr)
    new_arr = []
    temp_arr = []
    biggest_length = 0
    index = 0

    arr.each_with_index do |sub, idx|
        if sub.length > biggest_length
            biggest_length = sub.length
            index = idx
        end
    end

    (1..arr[index].length).each_with_index do |sub, i|
        (1..arr.length).each_with_index do |ele, j|
            if arr[j][i] == nil
                temp_arr << nil
            else
                temp_arr << arr[j][i]
            end
        end
        new_arr << temp_arr
        temp_arr = []
    end

    new_arr

end

def maximum(arr, &prc)
    return nil if arr.length == 0

    arr.inject do |acc, el|
        if prc.call(el) >= prc.call(acc)
            el
        else
            acc
        end
    end
end

def my_group_by(arr, &prc)
    hsh = Hash.new {|h,k| h[k] = []} 

    arr.each { |ele| hsh[prc.call(ele)] << ele }

    hsh
end

def max_tie_breaker(arr, prc1, &prc2)
    return nil if arr.length == 0

    arr.inject do |acc, el|
        if prc2.call(acc) > prc2.call(el)
            acc
        elsif prc2.call(acc) < prc2.call(el)
            el
        else
            if prc1.call(acc) > prc1.call(el)
                acc
            elsif prc1.call(acc) > prc1.call(el)
                el
            else
                acc
            end
        end
    end
end

def silly_syllables(sent)
    vowel = "aeiou"
    sent_arr = sent.split(" ")
    temp1_word = ""
    temp2_word = ""
    new_word = ""
    new_sent = []

    sent_arr.each do |word|
        if word.split("").count { |letter| vowel.include?(letter)} < 2
            new_sent << word
        else
            reversed_word = word.reverse
            reversed_word.each_char.with_index do |char, i|
                if vowel.include?(char)
                    temp1_word = reversed_word[i..-1]
                    break
                end
            end
            temp2_word = temp1_word.reverse
            temp2_word.each_char.with_index do |char, i|
                if vowel.include?(char)
                    new_word = temp2_word[i..-1]
                    break
                end
            end
            new_sent << new_word
        end
    end
    new_sent.join(" ")
end

