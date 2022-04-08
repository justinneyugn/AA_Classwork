 def all_words_capitalized?(arr)
    if arr.all? { |word| word == word[0].upcase + word[1..-1].downcase}
        return true
    else
        return false
    end
 end

 def no_valid_url?(url_arr)
   
    if url_arr.none? { |url| has_proper_url(url) }
    return true
 else
    return false
 end
       
 end

 def has_proper_url(word)
    proper_url = [".com", ".net", ".io", ".org"]

    proper_url.each {|link| return true if word.include?(link)}

    false
 end
 
 def any_passing_students?(arr)
    if arr.any? { |hsh| average_grade(hsh[:grades]) }
        return true
    else
        return false
    end
end

 def average_grade(arr)
    if arr.sum/arr.length > 75
        return true
    else
        return false
    end
end

