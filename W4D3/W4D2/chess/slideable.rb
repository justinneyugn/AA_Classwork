# Rook/ Bishop / Queen
# Rook: Horizontal dirs
# Bishop: Diag dirs
# Queen: both Horizontal and Diag dirs

require_relative 'board'
require_relative 'piece'

module Slideable

    HORIZONTAL_DIRS = [
        [-1,0],
        [0,1],
        [1,0],
        [0,-1]
].freeze

    DIAGONAL_DIRS = [
        [1,1],
        [-1,-1], 
        [1,-1], 
        [-1,1]
].freeze


    def horizonal_dirs
        HORIZONTAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def moves
        all_moves = move_dirs
        grow_unblocked_moves_in_dir
    end

    private

    def move_dirs
        raise NotImplementedError
    end

    # [3,3]
    def grow_unblocked_moves_in_dir(dx, dy)
        unblocked_moves = []
        row = dx
        col = dy
        directions = self.moves
        directions.each do |move|
            new_row = dx + move[0]
            new_col = dy + move[1]
            new_pos = [new_row, new_col]
            # p @board[new_pos]
            unblocked_moves << new_pos if valid_move?(new_pos)
        end
        unblocked_moves
    end

    def valid_move?(pos)  #checking new pos
        return false if pos[0] < 0 || pos[0] > 7 || pos[1] < 0 || pos[1] > 7
        return false if @board[pos].color == @color
        true
    end



         #   0   1   2   3   4  5    6   7
        # 0[ _ , _ , _ , _ , _ , _ , _ , _ ]
        # 1[ _ , _ , K , _ , K , _ , _ , _ ]
        # 2[ _ , _ , _ , _ , _ , _ , _ , _ ]
        # 3[ _ , _ , _ , K , _ , _ , _ , _ ]
        # 4[ _ , _ , _ , _ , _ , _ , _ , _ ]
        # 5[ _ , _ , K , _ , K , _ , _ , _ ]
        # 6[ _ , _ , _ , _ , _ , _ , _ , _ ]
        # 7[ _ , _ , _ , _ , _ , _ , _ , _ ]

        

    
    
end


# class SlidingPiece < Piece

#     include Slideable

#     attr_reader :symbol

#     def initialize(color, board, pos)
#         super
#     end

#     def symbol
#         @board.rows[pos]
#     end


#     private

#     def move_dirs

#     end

# end