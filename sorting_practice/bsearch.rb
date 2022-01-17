class Array
    def bsearch(target)
        return nil if self.empty?
        middle = self.length / 2
        if self[middle] > target
            self[0...middle].bsearch(target)
        elsif self[middle] == target
            return middle
        else
            check_right = self[middle+1..-1].bsearch(target)
            return check_right + middle + 1 unless check_right == nil
        end
    end
end

a = [1, 2, 3, 4, 5]
p a.bsearch(8)