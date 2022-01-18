class Array
    def bsearch(target)
        return nil if self.empty?
        pivot = self.length / 2
        if self[pivot] > target
            self[0...pivot].bsearch(target)
        elsif self[pivot] == target
            return pivot
        else
            check_right = self[pivot + 1..-1].bsearch(target)
            check_right + pivot + 1 unless check_right == nil
        end
    end
end

a = [1, 2, 3, 4, 5]
p a.bsearch(4)
