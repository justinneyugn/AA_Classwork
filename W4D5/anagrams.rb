# This is O(n!)
def first_anagram?(string1, string2)
  str1_arr = string1.split("")
  anagrams = str1_arr.permutation.map { |word| word.join("")}
  anagrams.include?(string2)
end

# This is O(n)
def second_anagram?(string1, string2)
  str1_arr = string1.split("")
  str2_arr = string2.split("")

  str1_arr.each_with_index do |letter, i|
    return false unless str2_arr.include?(letter)
    index = str2_arr.index(letter)
    str2_arr.delete_at(index)
  end

  str2_arr.empty?
end

# This is O(n logn) (aka quicksort)
def third_anagram?(string1, string2)
  string1.split("").sort! == string2.split("").sort!
end

# This is O(n)
def fourth_anagrams?(string1, string2)
  str_hash = Hash.new(0)
  string1.each_char do |letter|
    str_hash[letter] += 1
  end
  string2.each_char do |letter|
    str_hash[letter] -= 1
  end
  str_hash.values.uniq == [0]
end

# p first_anagram?("cat","tca")         #=> true
# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true

# p second_anagram?("cat","tca")          #=> true
# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true

# p third_anagram?("cat","tca")          #=> true
# p third_anagram?("gizmo", "sally")    #=> false
# p third_anagram?("elvis", "lives")    #=> true

# p fourth_anagrams?("cat","tca")          #=> true
# p fourth_anagrams?("gizmo", "sally")    #=> false
# p fourth_anagrams?("elvis", "lives")    #=> true
