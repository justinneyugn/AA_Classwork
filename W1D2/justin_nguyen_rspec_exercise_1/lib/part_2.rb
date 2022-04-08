def hipsterfy(word)
    vowel = "aeiou"
    word_arr = word.split("")

    return word if word_arr.none? { |letter| vowel.include?(letter)}

    i = word.length - 1

    while i >= 0
         break if vowel.include?(word[i])
         i -= 1   
    end

    
    word[0...i] + word[i+1..-1]
end

def vowel_counts(str)
    vowel = "aeiou"
    vowel_count = Hash.new(0)

    str.each_char { |letter| vowel_count[letter.downcase] += 1 if vowel.include?(letter.downcase) }

    vowel_count
end

def caesar_cipher(message, num)
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    new_message = ""
    
    message.each_char.with_index do |char, i|
        if !alphabet.include?(char)
            new_message += char
            next
        end

        old_idx = alphabet.index(char)
        new_idx = old_idx + num
        new_char = alphabet[new_idx % 26]
        new_message += new_char
    end

    new_message
end