def element_count(arr)
    hsh = Hash.new(0)

    arr.each { |ele| hsh[ele] += 1}

    hsh
end

def char_replace!(str, hsh)
    str.each_char.with_index { |letter, i| str[i] = hsh[letter] if hsh.has_key?(letter) }

    str
end

def product_inject(arr)
    arr.inject { |total_product, el| total_product * el}
end

