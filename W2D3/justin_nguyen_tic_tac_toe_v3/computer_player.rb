class ComputerPlayer
    attr_reader :mark

    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position(legal_positions)
        max = legal_positions.length
        position_chosen = legal_positions[rand(0...max)]

        puts "Computer's mark: #{@mark}"
        puts "The position they chose was:"
        p position_chosen

        position_chosen
    end
end