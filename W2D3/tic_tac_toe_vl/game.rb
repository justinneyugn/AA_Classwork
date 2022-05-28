require_relative "./board.rb"
require_relative "./human_player.rb"

class Game
    def initialize(player_1_mark, player_2_mark)
        @player_1_mark = HumanPlayer.new(player_1_mark)
        @player_2_mark = HumanPlayer.new(player_2_mark)
        @board = Board.new
        @current_player = @player_1_mark
    end

    def switch_turn
        if @current_player == @player_1_mark
            @current_player = @player_2_mark
        else
            @current_player = @player_1_mark
        end
    end

    def play
        current_player_pos = []

        while @board.empty_positions?
            @board.print
            current_player_pos = @current_player.get_position
            current_player_mark = @current_player.mark
            @board.place_mark(current_player_pos, current_player_mark)
            if @board.win?(current_player_mark)
                puts "VICTORY!! The winner is:" 
                return current_player_mark
            else
                self.switch_turn
            end
        end

        return "DRAW"
    end
end