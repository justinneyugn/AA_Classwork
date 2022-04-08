class Board
    attr_reader :max_height

    def self.build_stacks(num)
        Array.new(num) {Array.new(0)}
    end

    def initialize(num, max_height)
        raise 'rows and cols must be >= 4' if num < 4 || max_height < 4
        @max_height = max_height
        @stacks = Board.build_stacks(num)
    end

    def add(token, stack_idx)
        if @stacks[stack_idx].length < @max_height
            @stacks[stack_idx] << token
            return true
        else
            return false
        end
    end

    def vertical_winner?(token)
        @stacks.each { |stack| return true if stack.all?(token) && stack.length == @max_height}

        false
    end

    def horizontal_winner?(token)
        match = true
        (0...@stacks[0].length).each do |sub|
            (0...@stacks.length).each do |stack|
                match = false if @stacks[stack][sub] != token
            end
            return true if match
            match = true
        end

        false
    end

    def winner?(token)
        return true if vertical_winner?(token) || horizontal_winner?(token)

        false
    end
    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @stacks.each { |stack| p stack }
    end
end
