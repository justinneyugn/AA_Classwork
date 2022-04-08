def average(num_1, num_2)
    (num_1+num_2)/2.0
end

def average_array(arr)
    return arr.sum/(arr.length * 1.0)
end

def repeat(str, num)
    return str * num
end

def yell(str)
    return str.upcase + "!"
end

def alternating_case(str)
    str_arr = str.split(" ")
    new_str = []

    str_arr.each_with_index do |word, i|
        if i % 2 == 0
            new_str << word.upcase
        else
            new_str << word.downcase
        end
    end
    new_str.join(" ")
end