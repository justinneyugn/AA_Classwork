# 8 positions where it can go

module Stepable

    def moves
        unblocked_moves = []
        row = pos[0]
        col = pos[1]
        directions = move_diffs
        directions.each do |move|
            new_row = dx + move[0]
            new_col = dy + move[1]
            new_pos = [new_row, new_col]
            # p @board[new_pos]
            unblocked_moves << new_pos if valid_move?(new_pos)
        end
        unblocked_moves
    end

    private

    def move_diffs #overwritten by subclass
        raise NotImplementedError
    end


    def valid_move?(pos)  #checking new pos
        return false if pos[0] < 0 || pos[0] > 7 || pos[1] < 0 || pos[1] > 7
        return false if @board[pos].color == @color
        true
    end

end