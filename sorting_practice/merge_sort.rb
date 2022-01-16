require "byebug"
def merge_sort(array, &prc)
    prc ||= Proc.new {|a,b| a <=> b}
    # debugger
    return array if array.length <= 1
    middle = array.length / 2
    left = array.take(middle)
    right = array.drop(middle)
    sorted_left = merge_sort(left, &prc)
    sorted_right = merge_sort(right, &prc)
    merge(sorted_left, sorted_right, &prc)
end

def merge(left, right, &prc)
    merged_arr = []
    until left.empty? || right.empty?
        if prc.call(left.first, right.first) == -1
            merged_arr << left.shift
        else
            merged_arr << right.shift
        end
    end
    merged_arr + left + right
end

p merge_sort([1, 4, 5, 2, 3])
