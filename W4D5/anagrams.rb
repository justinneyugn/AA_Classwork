

def first_anagram?(string1, string2)
  anagrams = []
  # string1.each_char.with_index do |letter, i|
    # substr = string1[i+1..-1].split
    # until substr == string1[i+1..-1] 
    #   new_anagram = letter + substr.join
    #   anagrams << new_anagram if !anagrams.include?(new_anagram)
    #   substr.rotate
    # end
  # end
  string1.each_char.with_index do |letter1, i|
    string1.each_char.with_index do |letter2, j|
      anagrams << string1[i..j] if string1[i..j].length == string1.length
    end
  end

  p anagrams
end

first_anagram?("cat","heh")