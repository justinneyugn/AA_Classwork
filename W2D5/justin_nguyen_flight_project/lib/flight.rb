class Flight
    attr_reader :passengers

    def initialize(flight_num, capacity)
        @flight_number = flight_num
        @capacity = capacity
        @passengers = []
    end

    def full?
        return true if @passengers.length >= @capacity

        false
    end

    def board_passenger(passenger)
        @passengers << passenger if !self.full? && passenger.has_flight?(@flight_number)
    end

    def list_passengers
        names = @passengers.map { |passenger| passenger.name }
    end

    def [](i)
        @passengers[i]
    end

    def <<(passenger)
        self.board_passenger(passenger)
    end
end