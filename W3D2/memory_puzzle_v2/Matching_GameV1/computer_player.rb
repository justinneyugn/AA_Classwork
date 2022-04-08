class Computer_Player

    def initialize(size)
        @known_cards = Hash.new{|h,k| h[k] = []}
        @matched_cards = Array.new()
        @size = size
    end

    def receive_revealed_card(position, value)

        @known_cards[value] << position

    end

    def receive_match(position_one, position_two) 

        @matched_cards << position_one
        @matched_cards << position_two

    end

    def get_position1
        if @matched_cards.length == 0
            row = rand(0...@size)
            col = rand(0...@size)
            guess = [row, col]
        else
            @matched_cards[0]
        end
    end

end