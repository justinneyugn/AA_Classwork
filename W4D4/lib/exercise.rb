# require "byebug"
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


def stock_picker(arr)
    # debugger
    smallest = arr.min
    smallest_idx = 0
    largest = arr.max
    largest_idx = 0

    arr.each_with_index do |ele, i|
        if ele == smallest
            smallest_idx = i
        elsif ele == largest && i > smallest_idx
            largest_idx = i
        end
    end
    [smallest_idx, largest_idx]
end

# p  stock_picker([1, 10, 5, 0, 50, 30, 80])

class Game

    def initialize
        @array_one = [1,2,3,4,5]
        @array_two = []
        @array_three = []
        @won = false
    end

    def move
        valid = false
        i = 0
        while !won? && i != 0
            while !valid
                valid = true
                p "enter which stack you want to pick from"
                start_stack = gets.chomp
                case start_stack
                when "1"
                    if !@array_one.empty?
                        ele = @array_one.shift 
                    else
                        valid = false
                    end
                when "2"
                    if !@array_two.empty?
                        ele = @array_two.shift
                    else
                        valid = false
                    end
                when "3"
                    if !@array_three.empty?
                        ele = @array_three.shift
                    else
                        valid = false
                    end
                else
                    p "invalid choice"
                    valid = false
                end
            end
            valid = false
            while !valid
                valid = true
                p "enter which stack you want to place"
                end_stack = gets.chomp
                case end_stack
                when "1"
                    if (!@array_one.empty? && ele < @array_one[0]) || @array_one.empty?
                        @array_one.unshift(ele)
                    else
                        valid = false
                    end
                when "2"
                    if (!@array_two.empty? && ele < @array_two[0]) || @array_two.empty?
                        @array_two.unshift(ele)
                    else
                        valid = false
                    end
                when "3"
                    if (!@array_three.empty? && ele < @array_three[0]) || @array_three.empty?
                        @array_three.unshift(ele)
                    else
                        valid = false
                    end
                else
                    p "invalid choice"
                    valid = false
                end
            end
            i += 1
        end
    end

    def won?
        arr = [@array_one, @array_two, @array_three]
        return true if arr.count{ |stack| stack.empty? } == 2
        false
    end

end