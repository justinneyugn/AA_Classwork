require_relative 'nullpiece'
require_relative 'piece'

class Board

    attr_reader :rows

    def initialize
        @rows = Array.new(8) { Array.new(8, NullPiece.instance) }
        (0..1).each do |row|
            (0..7).each do |col|
                @rows[row][col] = Piece.new.piece
            end
        end

        (0..7).each do |col|
            @rows[-2][col] = Piece.new.piece
            @rows[-1][col] = Piece.new.piece
        end 
    end

    def [](pos)
        row, col = pos
        @rows[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @rows[row][col] = val
    end

    def move_piece(start_pos, end_pos)
        raise "Error, no piece here" if self[start_pos].nil? || self[start_pos].symbol == "null"
        raise "Start position is outside the board" if !(start_pos[0].between?(0,7) && start_pos[1].between?(0,7))
        raise "End position is outside the board" if !(end_pos[0].between?(0,7) && end_pos[1].between?(0,7))
        raise "That position is not valid" if self[end_pos].symbol != "null"

        move_piece!(start_pos, end_pos)
    end

    def move_piece!(start_pos, end_pos)
        self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
    end



end