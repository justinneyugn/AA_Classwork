 require_relative "card"
 require_relative "board"
 
 class Game

    attr_reader :grid

    def initialize(size)
        @grid = Board.new(size)
        @current_guess = ""
        @previous_guess = ""
    end

    def play
        @grid.populate
        @grid.flip_down
        while !@grid.won? 
            @grid.render
            guessed_position = self.get_position
            self.make_guess(guessed_position)

        end
        @grid.render
        puts "WINNER!!!"


    end

    def get_position
        puts "Enter Position, with the following format '2 2' "
        guess = gets.chomp.split(" ").map(&:to_i)
    
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