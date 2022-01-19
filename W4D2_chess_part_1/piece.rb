require_relative "board"

class Piece
    attr_reader 
    
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def to_s

    end

    def empty?
        return true if @board.[](@pos) == NullPiece.new
        false
    end

    def valid_moves

    end

    def pos=(val)
        @board.[]=(@pos, val)
    end

    def symbol

    end

    private

    def move_into_check?(end_pos)

    end
end