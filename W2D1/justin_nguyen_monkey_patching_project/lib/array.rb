# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        return nil if self.length == 0

        smallest = self.inject do |acc, el|
            if acc > el 
                el
            else
                acc
            end
        end

        largest = self.inject do |acc, el|
            if acc > el 
                acc
            else
                el
            end
        end

        largest - smallest
    end

    def average
        return nil if self.length == 0

        self.sum * 1.0 / self.length 
    end

    def median
        return nil if self.length == 0

        sorted = self.sort

        if sorted.length % 2 == 0
            left_middle = sorted.length / 2 - 1
            right_middle = sorted.length / 2
            return (sorted[left_middle] + sorted[right_middle] * 1.0) / 2
        else
            middle = sorted.length / 2
            return sorted[middle]
        end
    end

    def counts
        hsh = Hash.new(0)

        self.each { |ele| hsh[ele] += 1 }

        hsh
    end

    def my_count(val)
        counter = 0

        self.each { |num| counter += 1 if num == val}

        counter
    end

    def my_index(val)
        return nil if !self.include?(val)

        index = 0
        self.each_with_index do |ele, i|
            if ele == val
                index = i
                break
            end
        end

        index
    end

    def my_uniq
        new_arr = []

        self.each { |ele| new_arr << ele if !new_arr.include?(ele) }

        new_arr
    end

    def my_transpose
        new_arr = []
        temp = []

        self.each_with_index do |sub, i|
            self.each_with_index do |ele, j|
                temp << self[j][i]
            end
            new_arr << temp
            temp = []
        end

        new_arr
    end
end
