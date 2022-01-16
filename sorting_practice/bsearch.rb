require "byebug"
def bsearch(array, target)
    # debugger
    return nil if array.empty?

    middle = array.length / 2

    if array[middle] > target
        bsearch(array[0...middle],target)
    elsif array[middle] == target 
        return middle
    else
        check_right = bsearch(array[middle+1..-1], target)
        return check_right + middle + 1 unless check_right == nil
    end
end

p bsearch([1, 2, 3, 4, 5], 3) #2
p bsearch([1, 2, 3, 4, 5], 1) #0
p bsearch([1, 2, 3, 4, 5], 4) #3
p bsearch([1, 2, 3, 4, 5], 8) #nil
