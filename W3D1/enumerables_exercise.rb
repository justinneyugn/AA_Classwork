require "byebug"
class Array 
    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1
        end
        self
    end

    def my_select(&prc)
        new_arr = []
        self.my_each {|ele| new_arr << ele if prc.call(ele)}
        return new_arr
    end

    def my_reject(&prc)
        new_arr = []
        self.my_each {|ele| new_arr << ele if !prc.call(ele)}
        return new_arr
    end
    def my_any?(&prc)
        self.my_each { |ele| return true if prc.call(ele)}
        return false
    end
    def my_all?(&prc)
        self.my_each { |ele| return false if !prc.call(ele)}
        return true
    end

    def my_flatten
        return [self] if !self.is_a?(Array)
        new_arr = []
        self.each do |ele|
            if ele.is_a?(Array)
                new_arr += ele.my_flatten
            else
                new_arr << ele
            end
        end
        new_arr
    end

    def my_zip(*arr)
        new_arr = Array.new(self.length) {Array.new}

        (0...self.length).each do |self_idx|
            new_arr[self_idx] << self[self_idx]
            arr.each_with_index do |sub, idx| 
                new_arr[self_idx] << sub[self_idx]
            end
        end
        new_arr
    end
    def my_rotate(rotate=1)
        new_arr = self.dup
        #debugger
        if rotate > 0
            (rotate).times do 
                current_ele = new_arr.shift
                new_arr << current_ele
            end
        else rotate < 0
            (rotate * -1).times do 
                current_ele = new_arr.pop
                new_arr.unshift(current_ele)
            end
        end
        return new_arr
    end

    def my_join(sep = "")
        str = ""
        self.each do |ele|
            if ele != self[-1]
                str += ele + sep
            else
                str += ele
            end
        end
        str
    end

    def my_reverse
        reverse = []
        self.each do |ele|
            reverse.unshift(ele)
        end
        reverse
    end

end

p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
p [ 1 ].my_reverse               #=> [1]




