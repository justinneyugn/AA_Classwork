# Pawn: If first move, then two spots up left or up right. Otherwise, one spot 

class Pawn < Piece
    def symbol
        '♟'.colorize(color)
    end

    def moves
        pawn_moves = [[1, 1], [1, -1]]
    end

    private

    def at_start_row?
        if @pos[0] == 0
            return true
        else
            return false
        end
    end
    
    def forward_dir
        # if user wants to go right, return 1
        # if left, return -1
    end

    def forward_steps

    end

    # def side_attacks
    #     #not needed
    # end


end