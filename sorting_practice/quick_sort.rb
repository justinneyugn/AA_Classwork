class Array
    def quicksort
        return self if self.length < 2
        pivot = self.first
        left = self.drop(1).select { |num| num < pivot}
        right = self.drop(1).select { |num| num >= pivot}
        sorted_left = left.quicksort
        sorted_right = right.quicksort
        sorted_left + [pivot] + sorted_right
    end
end

b = [1, 1, 1, 2, 1, 9, 1]
p b.quicksort
a = [3, 1, 90, 5, 87]
p a.quicksort
