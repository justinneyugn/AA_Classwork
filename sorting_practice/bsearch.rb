def bsearch(array, target)
    return nil if array.empty?

    middle = array.length / 2
    if array[middle] > target
        bsearch(array[0...middle], target)
    elsif array[middle] == target
        return middle
    else
        check_right = bsearch(array[middle+1..-1], target)
        return check_right + middle + 1 if check_right != nil
    end
end

a = [1, 2, 3, 4, 5]
p bsearch(a, 8)