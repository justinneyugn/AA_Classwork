# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.


def largest_prime_factor(num)
    largest_factor = 0

    (2..num).each do |factor|
        next if !prime?(factor)
        largest_factor = factor if num % factor == 0  
    end

    largest_factor
end

def prime?(num)
    if num < 2
      return false
    end
  
    (2...num).each do |factor|
      if num % factor == 0
        return false
      end
    end
  
    return true
  end

def unique_chars?(str)
    str_arr = str.split("")

    str_arr.each do |char|
        count = str_arr.count { |letter| letter == char }
        return false if count > 1
    end

    return true
end

require "byebug"
def dupe_indices(arr)
    no_repeats = true
    arr.each do |letter|
        if !(arr.one? { |el| el == letter })  
            no_repeats = false 
            break
        end
    end

    return {} if no_repeats

    vowels = Hash.new{|h,k| h[k] = [] }

    arr.each_with_index do |letter, idx|
        if !vowels.has_key?(letter) && (arr.count { |char| char == letter }) > 1
            arr.each_with_index do |let, i|
                if letter == let
                    vowels[letter] << i 
                end
            end
        end
    end

    return vowels
end

def ana_array(arr1, arr2)
    hsh1 = Hash.new(0)
    hsh2 = Hash.new(0)

    arr1.each { |ele| hsh1[ele] += 1 }

    arr2.each { |ele| hsh2[ele] += 1}

    if hsh1 == hsh2
        return true
    else 
        return false
    end
end


