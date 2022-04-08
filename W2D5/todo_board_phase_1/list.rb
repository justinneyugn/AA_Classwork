require_relative "./item.rb"

class List
    attr_accessor :label

    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description = "")
        d_arr = deadline.split("-")
        return false if d_arr.length != 3
        return false if d_arr[0].length != 4 
        return false if d_arr[1].length != 2 || d_arr[2].length != 2 
        return false if d_arr[1].to_i < 1 || d_arr[1].to_i > 12
        return false if d_arr[2].to_i < 1 || d_arr[2].to_i > 31
        
        new_item = Item.new(title, deadline, description)
        @items << new_item
        true
    end

    def size
        @items.length
    end

    def valid_index?(index)
        return false if index < 0 || index >= @items.length
        true
    end

    def swap(index_1, index_2)
        return false if !valid_index?(index_1.to_i) || !valid_index?(index_2.to_i)

        @items[index_1.to_i], @items[index_2.to_i] = @items[index_2.to_i], @items[index_1.to_i]
        true
    end

    def [](index)
        return nil if !valid_index?(index)

        @items[index]
    end

    def priority
        @items[0]
    end

    def print
        puts @label.upcase
        puts
        puts "[Index, Item, Deadline]:"
        puts
        @items.each_with_index do |item, i|
            puts "[" + i.to_s + ", " + item.title + ", " + item.deadline + "]"
            puts
        end
    end

    def print_full_item(index)
        if valid_index?(index.to_i)
            puts "[" + @items[index.to_i].title + ", " + @items[index.to_i].description + ", " + @items[index.to_i].deadline + "]"
            puts
        end
    end

    def print_priority
        print_full_item(0)
    end

    def up(index, amount = 1)
        return false if !valid_index?(index.to_i)
        return true if index.to_i == 0
        i = 0
        idx = index.to_i

        while i < amount.to_i && idx > 0
            @items[idx-1], @items[idx] = @items[idx], @items[idx-1]
            idx -= 1
            i += 1
        end
        true
    end

    def down(index, amount = 1)
        return false if !valid_index?(index.to_i)
        return true if index.to_i == @items.length - 1
        i = 0
        idx = index.to_i

        while i < amount.to_i && idx < @items.length - 1
            @items[idx], @items[idx+1] = @items[idx+1], @items[idx]
            idx += 1
            i += 1
        end
        true
    end

    def sort_by_date!
        @items.sort_by! { |item| item.deadline }
    end
end
