class HumanPlayer
    attr_reader :mark

    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position
        number = "0123456789"

        puts "Player #{@mark}:"
        puts "Enter the row and column you would like to make your next play in the form of 'row col'"
        puts "Ex: '4 7'"

        position = gets.chomp
        pos_arr = position.split(" ")
        raise "invalid input" if pos_arr.length != 2 

        pos_arr.each do |ele|
            raise "invalid input" if !number.include?(ele)
        end

        pos_arr.map! { |num| num.to_i}
    end
end