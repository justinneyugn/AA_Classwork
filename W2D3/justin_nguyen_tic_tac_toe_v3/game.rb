require_relative "./board.rb"
require_relative "./human_player.rb"
require './computer_player.rb'

class Game
    def initialize(size, players)
        @board = Board.new(size)
        @players = players.map do |mark, is_computer|
            is_computer ? ComputerPlayer.new(mark) : HumanPlayer.new(mark)
        end
        @current_player = @players.first
    end

    def switch_turn
        @current_player = @players.rotate!.first
    end

    def play
        current_player_pos = []

        while @board.empty_positions?
            @board.print
            legal = @board.legal_positions
            current_player_pos = @current_player.get_position(legal)
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