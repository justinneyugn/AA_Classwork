require "byebug"
def bad_two_sum?(arr, target_sum)
    subarr = []
    arr.each_with_index do |num1, i|
        arr.each_with_index do |num2, j|
            subarr << num1 + num2 if i < j
        end
    end
    subarr.include?(target_sum)
end

arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

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

p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false