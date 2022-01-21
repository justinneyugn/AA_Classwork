def first_anagram?(string1, string2)
  str1_arr = string1.split("")
  anagrams = str1_arr.permutation.map { |word| word.join("")}
  anagrams.include?(string2)
end


p first_anagram?("cat","tca")
p first_anagram?("gizmo", "sally")    #=> false
p first_anagram?("elvis", "lives")    #=> true


