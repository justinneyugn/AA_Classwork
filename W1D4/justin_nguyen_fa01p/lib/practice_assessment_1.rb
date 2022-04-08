# Define your methods here. 
def first_letter_vowel_count(sent)
    sent_arr = sent.split(" ")
    vowel = "aeiou"
    counter = 0 

    sent_arr.each {|word|counter += 1 if vowel.include?(word[0].downcase)}

    counter
end

def count_true(arr, proc)
    arr.count { |ele| proc.call(ele)}
end

def procformation(arr, prc1, prc2, prc3)
    arr.map do |num|
        if prc1.call(num)
            prc2.call(num)
        else
            prc3.call(num)
        end
    end
end

def array_of_array_sum(arr)
    total = 0

    arr.each { |sub| total += sub.sum }

    total
end

def selective_reverse(sent)
    vowel = "aeiou"

    new_sent = sent.split.map do |word|
        if vowel.include?(word[0]) || vowel.include?(word[-1])
            word
        else
            word.reverse
        end
    end

    new_sent.join(" ")
end

def hash_missing_keys(hsh, *other)
    return other if other.length == 0
    missing = []

    other.each { |ele| missing << ele if !(hsh.has_key?(ele)) }

    missing

end