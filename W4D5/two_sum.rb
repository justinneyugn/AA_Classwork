require "byebug"

# This is O(n**2)
def bad_two_sum?(arr, target_sum)
    subarr = []
    arr.each_with_index do |num1, i|
        arr.each_with_index do |num2, j|
            subarr << num1 + num2 if i < j
        end
    end
    subarr.include?(target_sum)
end

# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

# This is O(n logn)
def okay_two_sum?(arr, target_sum)
    # debugger
    sorted = arr.sort
    (0...sorted.length-1).each do |i|
        temp_target = target_sum - sorted[i]
        # p "--------"
        # p temp_target
        # p sorted[i..-1]
        element = sorted[i..-1].bsearch {|x| x == temp_target}
        # p element
        return true if !element.nil?
    end
    false
end

# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false

def two_sum?(arr, target_sum)
    hash = Hash.new(0)
    arr.each do |num|
        hash[num] = target_sum - num
    end
    # p hash
    hash.each do |k, v|
        return true if hash.has_key?(v) && k != v
    end
    false
end

# arr = [0, 1, 5, 7]
# p two_sum?(arr, 6) # => should be true
# p two_sum?(arr, 10) # => should be false

# arr2 = [0, 1, 5, 7, 3, 3]
# p two_sum?(arr2, 6) # => should be true
# p two_sum?(arr2, 10) # => should be true
