def my_reject(arr, &prc)
    new_arr = []

    arr.each { |ele| new_arr << ele if !(prc.call(ele)) }

    new_arr
end

def my_one?(arr, &prc)
    counter = 0

    arr.each { |ele| counter += 1 if prc.call(ele) }

    return true if counter == 1

    false
end

def hash_select(hsh, &prc)
    new_hsh = {}

    hsh.each { |letter, num| new_hsh[letter] = num if prc.call(letter, num) }

    new_hsh
end

def xor_select(arr, prc1, prc2)
    new_arr = []

    arr.each do |num| 
        new_arr << num if (prc1.call(num) || prc2.call(num)) && !(prc1.call(num) && prc2.call(num)) 
    end

    new_arr
end

def proc_count(val, arr)
    arr.count {|prc| prc.call(val)}
end


