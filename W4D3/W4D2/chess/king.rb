require_relative 'piece'
require_relative 'board'
require_relative 'stepable'
require 'colorize'

class King < Piece
    include Stepable

    def initialize(color, board, pos)
        super
    end

    def symbol
        '♔'.colorize(color)
    end

    protected

    def move_diffs
        possible_moves = [
        [0,1],
        [0,-1],
        [1,0],
        [-1,0],
        [1,1],
        [1,-1],
        [-1,1],
        [-1,-1]
    ]
    end
end