class GuessingGame
    attr_reader :num_attempts

    def initialize(min, max)
        @min = min
        @max = max
        @secret_num = rand(min..max)
        @num_attempts = 0
        @game_over = false
    end

    def game_over?
        @game_over
    end

    def check_num(num)
        @num_attempts += 1
        
        if num == @secret_num
            @game_over = true
            puts "you win"
        elsif num  > @secret_num
            puts "too big"
        elsif num < @secret_num.to_i
            puts "too small"
        end
    end

    def ask_user
        puts "enter a number"
        number = gets
        check_num(number.chomp.to_i)
    end
end
