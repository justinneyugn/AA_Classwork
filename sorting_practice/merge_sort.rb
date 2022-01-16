class Array
    def merge_sort(&prc)
        prc ||= Proc.new{|a,b| a <=> b}
        return self if self.length < 2
        middle = self.length / 2
        left = self.take(middle)
        right = self.drop(middle)
        sorted_left = left.merge_sort(&prc)
        sorted_right = right.merge_sort(&prc)
        self.merge(sorted_left, sorted_right, &prc)
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
end

a = [1, 4, 5, 2, 3]
p a.merge_sort 