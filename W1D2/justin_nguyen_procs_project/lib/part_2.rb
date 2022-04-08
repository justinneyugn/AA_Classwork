def reverser(str, &blck)
    str.reverse!
    blck.call(str)
end

def word_changer(str, &blck)
    str_arr = str.split(" ")
    new_arr = str_arr.map {|word| blck.call(word)}
    new_arr.join(" ")
end

def greater_proc_value(num, prc1, prc2)
    answer1 = prc1.call(num)
    answer2 = prc2.call(num)

    if answer1 > answer2
        return answer1
    else
        return answer2
    end
end

def and_selector(arr, proc1, proc2)
    arr.select {|num| proc1.call(num) && proc2.call(num)}
end

def alternating_mapper(arr, proc1, proc2)
    new_arr = []

    arr.each_with_index do |num, i|
        if i % 2 == 0
            new_arr << proc1.call(num)
        else
            new_arr << proc2.call(num)
        end
    end

    new_arr
end