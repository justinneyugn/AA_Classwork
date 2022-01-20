require_relative 'piece'
require_relative 'board'
require_relative 'stepable'

class Knight < Piece
    include Stepable

    def symbol
        '♘'.colorize(color)
    end

    protected

    def move_diffs
        possible_moves = [
            [-2, 1], 
            [-2, -1],
            [2, 1],
            [2, -1],
            [1, -2],
            [1, 2],
            [-1, -2],
            [-1, 2]
        ]

    end
end