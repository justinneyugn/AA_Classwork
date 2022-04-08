 require_relative "card"
 require_relative "board"
 require_relative "human_player"
 
 class Game

    attr_reader :grid

    def initialize(size)
        @grid = Board.new(size)
        @current_guess = ""
        @previous_guess = ""
        @human_player = Human_Player.new()
    end

    def play
        @grid.populate
        @grid.flip_down
        while !@grid.won? 
            @grid.render
            guessed_position = @human_player.get_position
            if @grid.valid_position?(guessed_position) && @grid[guessed_position].face_up == false
                self.make_guess(guessed_position)
            end

        end
        @grid.render

        puts "WINNER!!!"


    end

    def make_guess(position)
        if !self.has_guess
            @previous_guess = @grid[position]
            @grid[position].reveal
        else
            @current_guess = @grid[position]
            @grid[position].reveal
            if !(@previous_guess == @current_guess)
                @grid.render
                sleep(5)
                @current_guess.hide
                @previous_guess.hide
                system("clear")
            end
            
            @previous_guess = ""
        end

    end

    # def has_position?(array)

    #     array.length == 2

    # end

    def has_guess
        return false if @previous_guess  == ""
        true
    end

 end