class Card
    attr_reader :face_value, :face_up

    def initialize
        @face_up = true
        @face_value = ("A".."Z").to_a.sample
    end

    # def self.

    def display
        return @face_value if @face_up

        return "_" if !@face_up
    end

    def hide
        @face_up = false
    end

    def reveal
        @face_up = true
    end

    # Only use when both cards are @face_up == true
    def ==(another_card)
        self.display == another_card.display
    end

end