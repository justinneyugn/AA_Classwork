class Passenger
    attr_reader :name

    def initialize(name)
        @name = name
        @flight_numbers = []
    end

    def has_flight?(flight_num)
        alphabet = "abcdefghijklmnopqrstuvwxyz"
        flight_num_arr = flight_num.split("")
        new_num = flight_num_arr.map do |char|
            if alphabet.include?(char)
                char.upcase
            else
                char
            end
        end
        return true if @flight_numbers.include?(new_num.join)

        false
    end

    def add_flight(flight)
        alphabet = "abcdefghijklmnopqrstuvwxyz"
        flight_num_arr = flight.split("")
        new_num = flight_num_arr.map do |char|
            if alphabet.include?(char)
                char.upcase
            else
                char
            end
        end

        @flight_numbers << new_num.join if !has_flight?(flight)
    end
end