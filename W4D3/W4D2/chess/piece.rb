require_relative "board"
require_relative "nullpiece"
require_relative "slideable"
require_relative "stepable"

class Piece
    include Slideable
    include Stepable
    attr_reader :color, :board, :pos
    
    def initialize(color, board, pos)
        @color = color #:white, :black
        @board = board
        @pos = pos
    end

    def to_s

    end

    def empty?
        return true if @board.[](@pos) == NullPiece.instance
        false
    end

    def valid_moves
        moves
    end

    def pos=(val)
        @board.[]=(@pos, val)
    end

    def symbol
        self.symbol
    end

    private

    def move_into_check?(end_pos)

    end
end