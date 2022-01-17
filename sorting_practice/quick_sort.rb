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


# def quicksort(array)
#     return array if array.length < 2
#     pivot = array.first
#     left = array.drop(1).select { |num| num < pivot}
#     right = array.drop(1).select { |num| num > pivot}
#     sorted_left = quicksort(left)
#     sorted_right = quicksort(right)
#     sorted_left + [pivot] + sorted_right
# end


# b = [1, 1, 1, 2, 1, 9, 1]
# p quicksort(b)

class Array
    def quicksort(&prc)
        prc ||= Proc.new {|a,b| a <=> b}
        return self if self.length < 2
        pivot = self.first
        left = self.drop(1).select { |num| prc.call(num, pivot) == -1}
        right = self.drop(1).select { |num| prc.call(num, pivot) > -1}
        sorted_left = left.quicksort(&prc)
        sorted_right = right.quicksort(&prc)
        sorted_left + [pivot] + sorted_right
    end
end

b = [1, 1, 1, 2, 1, 9, 1]
p b.quicksort
a = [3, 1, 90, 5, 87]
p a.quicksort
