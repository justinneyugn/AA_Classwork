require_relative "./board.rb"
require_relative "./human_player.rb"

class Game
    def initialize(size, *mark)
        @board = Board.new(size)
        @players = mark.map { |m| HumanPlayer.new(m)}
        @current_player = @players[0]
    end

    def switch_turn
        @players.rotate!
        @current_player = @players[0]
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