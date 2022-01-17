class Array
    def bubble_sort
        sorted = false
        while !sorted
            sorted = true
            (0...self.length-1).each do |i|
                if self[i] > self[i+1]
                    self[i], self[i+1] = self[i+1], self[i]
                    sorted = false
                end
            end
        end
        self
    end
end

a = [47, 2, 98, 156, 1]
p a.bubble_sort