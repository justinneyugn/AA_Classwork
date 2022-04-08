# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num_1, num_2)
    if num_1 > num_2
        bigger = num_1
    else
        bigger = num_2
    end

    (bigger..(num_1*num_2)).each { |num| return num if (num % num_1) == 0 && (num % num_2) == 0}
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    bigram_arr = []

    (0...str.length-1).each { |num| bigram_arr << str[num..num+1]}

    bigram_arr.inject do |acc, el|
        counter_acc = 0
        counter_el = 0
        (0...str.length-1).each do |num|
            if str[num..num+1] == acc
                counter_acc += 1
            elsif str[num..num+1] == el
                counter_el += 1
            end
        end
        if counter_acc > counter_el
            acc
        else
            el
        end
    end
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        new_hsh = {}

        self.each { |k, v| new_hsh[v] = k }

        new_hsh
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        counter = 0

        self.each_with_index do |ele1, i|
            self.each_with_index do |ele2, j|
                if j > i
                    counter += 1 if ele1 + ele2 == num
                end
            end
        end

        counter
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)
        sorted = false
        prc ||= Proc.new { |a,b| a > b }

        while !sorted
            sorted = true
            (0...self.length - 1).each do |i|
                if (prc.call(self[i], self[i+1]) == -1) || (prc.call(self[i], self[i+1]) == 1) || prc.call(self[i], self[i+1])
                    self[i], self[i+1] = self[i+1], self[i]
                    sorted = false
                end
            end
        end

        self
    end
end
