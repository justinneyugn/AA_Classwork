class Array

    def uniq
        unique = []
        self.each do |num|
            unique << num if !unique.include?(num)
        end
        unique
    end

    def two_sum
        eq_zero = []
        (0...self.length).each do |idx1|
            (0...self.length).each do |idx2|
                eq_zero << [idx1, idx2] if idx2 > idx1 && self[idx1] + self[idx2] == 0
            end
        end
        eq_zero
    end

    
end

def my_transpose(arr)
    transpose_arr = Array.new(arr.length) {Array.new}
    arr.each do |sub|
        (0...arr.length).each do |i|
            transpose_arr[i] << sub[i]
        end
    end
    transpose_arr
end
