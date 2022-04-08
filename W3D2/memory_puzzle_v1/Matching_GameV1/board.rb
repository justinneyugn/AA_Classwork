require_relative "card"

class Board
    attr_reader :size

    def initialize(size)
        raise 'Enter an even size' if !size.even?
        @grid = Array.new(size) {[]}
        @size = size 
    end

    def populate
        number_of_pairs = @size * @size / 2
        index = 0
        previous_values = []
        previous_cards = []

        while index < @size/2 
            while @grid[index].length < @size
                card = Card.new
                if !previous_values.include?(card.face_value)
                    @grid[index] << card 
                    previous_values << card.face_value
                    previous_cards << card
                end
            end
            index += 1
        end

        index = @size/2

        while index < @size
            while @grid[index].length < @size
                delete_card = previous_cards.sample 
                dup_card = delete_card.dup
                @grid[index] << dup_card
                card_index = previous_cards.index(delete_card)
                previous_cards.delete_at(card_index)
            end
            index += 1
        end
    end

    def render

        cards_display = Array.new(size) {[]}

        @grid.each_with_index do |sub, i|
            sub.each_with_index do |card, i2|
                cards_display[i][i2] = card.display
            end
        end

        cards_display.each do |row|
            puts row.join(" ")
        end 

    end

    def won?
        @grid.each do |row|
            row.each do |card|
                return false if card.face_up == false
            end
        end
        true
    end

    def reveal(guessed_pos)
        row, col = guessed_pos[0], guessed_pos[1]
        card = @grid[row][col]
        if !card.face_up
            card.reveal
            card.display
        end
    end

    def [](guessed_pos)
        row, col = guessed_pos[0], guessed_pos[1]
        card = @grid[row][col]
    end

    def []=(guessed_pos, value)
        row, col = guessed_pos[0], guessed_pos[1]
        @grid[row][col] = value
    end

    def flip_up
        @grid.each do |row|
            row.each { |card| card.reveal }
        end
    end

    def flip_down
        @grid.each do |row|
            row.each { |card| card.hide }
        end
    end
end



 # @grid.each_with_index do |sub, i|
    #     if i < @size/2
    #         @size.times {sub << Card.new()}
