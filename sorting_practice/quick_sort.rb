# class Array
#     def quicksort
#         return self if self.length < 2
#         pivot = self.first
#         left = self.drop(1).select {|num| num < pivot}
#         right = self.drop(1).select {|num| num >= pivot}
#         sorted_left = left.quicksort
#         sorted_right = right.quicksort
#         sorted_left + [pivot] + sorted_right
#     end
# end


def quicksort(array)
    return array if array.length < 2
    pivot = array.first
    left = array.drop(1).select { |num| num < pivot}
    right = array.drop(1).select { |num| num > pivot}
    sorted_left = quicksort(left)
    sorted_right = quicksort(right)
    sorted_left + [pivot] + sorted_right
end

a = [3, 1, 90, 5, 87]
p quicksort(a)
b = [1, 1, 1, 2, 1, 9, 1]
p quicksort(b)
