class Item
    attr_accessor :title, :description
    attr_reader :deadline, :done

    def self.valid_date?(data_string)
        data = data_string.split("-")

        return false if data.length != 3
        return false if data[0].length != 4 
        return false if data[1].length != 2 || data[2].length != 2 
        return false if data[1].to_i < 1 || data[1].to_i > 12
        return false if data[2].to_i < 1 || data[2].to_i > 31
        true
    end

    def initialize(title, deadline, description)
        @title = title
        if Item.valid_date?(deadline)
            @deadline = deadline
        else
            raise "deadline is not valid"
        end
        @description = description
        @done = false
    end

    def deadline=(new_deadline)
        if Item.valid_date?(new_deadline)
            @deadline = new_deadline
        else
            raise "deadline is not valid"
        end
    end

    def toggle
        if @done == false
            @done = true
        else
            @done = false
        end
    end
end

