def palindrome?(str)
    new_str = ""
    str_arr = str.split("")

    str_arr.reverse_each { |letter| new_str << letter }

    return true if str == new_str

    return false
end

def substrings(str)
    sub_arr = []
    str_arr = str.split("")

    str_arr.each_with_index do |letter1, idx1|
        sub_arr << str_arr[idx1]
        str_arr.each_with_index do |letter2, idx2|
            if idx2 > idx1
                sub_arr << str_arr[idx1..idx2].join("")
            end
        end
    end
    sub_arr
end

def palindrome_substrings(str)
    new_arr = substrings(str)
    palsub_arr = []

    new_arr.each do |sub_string|
        if palindrome?(sub_string) && sub_string.length > 1
            palsub_arr << sub_string
        end
    end

    palsub_arr
end