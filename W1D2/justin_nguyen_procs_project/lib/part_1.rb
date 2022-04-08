def my_map(arr, &blck)
    new_arr = []

    arr.each do |ele|
        new_arr << blck.call(ele)
    end

    new_arr
end

def my_select(arr, &blck)
    new_arr = []

    arr.each { |ele| new_arr << ele if blck.call(ele) }

    new_arr
end

def my_count(arr, &blck)
    count = 0

    arr.each { |ele| count += 1 if blck.call(ele) }

    count
end

def my_any?(arr, &blck)
    arr.each { |ele| return true if blck.call(ele) }

    false
end

def my_all?(arr, &blck)
    arr.each { |ele| return false if !blck.call(ele) }

    true
end

def my_none?(arr, &blck)
    arr.each { |ele| return false if blck.call(ele)}

    true
end