 def select_even_nums(arr)
    arr.select { |ele| ele % 2 == 0}
 end

 def reject_puppies(hsh)
    older = []
    
    hsh.each { |hash| older << hash if hash["age"] > 2} 

    hsh.reject { |hash| hash["age"] > 2 }
        
    older
 end

 def count_positive_subarrays(arr)
    new_arr = []

    arr.each do |sub_arr|
        new_arr << sub_arr.sum
    end

    return new_arr.count { |num| num.positive? }
 end
=begin
 array_1 = [
    [-2, 5],
    [1, -9, 1],
    [4, 7]
  ]
p count_positive_subarrays(array_1)
=end

def aba_translate(word)
    vowel = "aeiou"
    current_word = word
    new_word = ""

    word.each_char do |char|
        if vowel.include?(char)
            new_word += char + "b" + char
        else
            new_word += char
        end
    end
    new_word
end

def aba_array(arr)
    new_arr = arr.map { |word| aba_translate(word) }
end
