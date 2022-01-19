require_relative 'nullpiece'
require_relative 'piece'

class Board

    def initialize
        @rows = Array.new(8) { Array.new(8, NullPiece.new.null) }
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
        row, col = pos[0], pos[1]
        @rows[pos]
    end

    def []=(pos, val)
        row, col = pos[0], pos[1]
        @rows[row][col] = val
    end

    def move_piece(start_pos, end_pos)
        raise "Error, no piece here" if @rows[start_pos].nil?
        raise "That position is not valid" if !valid_move?(end_pos)
    end



end