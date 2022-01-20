require_relative 'piece'
require_relative 'board'
require 'singleton'

class NullPiece < Piece
    attr_reader :symbol
    include Singleton

    def initialize
        @symbol = 'null'
    end

    def moves
        null_moves = [0, 0]
    end
end