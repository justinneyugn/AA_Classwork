class HumanPlayer
    attr_reader :mark

    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position(legal_positions)
        number = "0123456789"
        legal = false

        puts "Player #{@mark}:"
        puts "Enter the row and column you would like to make your next play in the form of 'row col'"
        puts "Ex: '4 7'"

        while !legal
            position = gets.chomp
            pos_arr = position.split(" ")
            if pos_arr.length != 2 || !number.include?(pos_arr[0]) || !number.include?(pos_arr[1])
                puts "This choice is ILLEGAL"
                puts "Enter another pair:"
                next
            end

            pos_arr.map! { |num| num.to_i }

            if !legal_positions.include?(pos_arr)
                puts "This choice is ILLEGAL"
                puts "Enter another pair:"
            else
                legal = true
            end
        end

        pos_arr.map! { |num| num.to_i}
    end
end