class Board
    def initialize
        @grid = Array.new(3) { |i| Array.new(3) { |i| "_"}}
    end

    def valid?(position)
        # position is an array as [row, column]

        return true if (position[0] < 3 && position[0] >= 0) && (position[1] < 3 && position[1] >= 0)

        false
    end

    def empty?(position)
        return true if @grid[position[0]][position[1]] == '_'

        false
    end

    def place_mark(position, mark)
        if !(self.valid?(position)) || !(self.empty?(position))
            raise "invalid mark"
        else
            @grid[position[0]][position[1]] = mark
        end
    end

    def print
        puts @grid.map { |x| x.join(' ')}
    end

    def win_row?(mark)
        @grid.each { |sub| return true if sub.count { |ele| ele == mark} == 3 }

        return false
    end

    def win_col?(mark)
        counter = 0

        @grid.each_with_index do |sub, i|
            @grid.each_with_index do |ele, j|
                counter += 1 if @grid[j][i] == mark
            end
            return true if counter == 3
            counter = 0
        end

        false
    end

    def win_diagonal?(mark)
        counter = 0
        @grid.each_with_index { |sub, i| counter += 1 if @grid[i][i] == mark }
        return true if counter == 3

        counter = 0
        i = 0
        j = 2
        while (i < 3) && (j >= 0)
            counter += 1 if @grid[j][i] == mark
            j -= 1
            i += 1
        end
        return true if counter == 3

        false
    end

    def win?(mark)
        return true if win_row?(mark) || win_col?(mark) || win_diagonal?(mark)

        false
    end

    def empty_positions?
        @grid.each_with_index do |sub, i|
            @grid.each_with_index { |ele, j| return true if @grid[j][i] == "_" }
        end

        false
    end

    # def fill(mark)
    #     @grid.each_with_index do |sub, i|
    #         @grid.each_with_index { |ele, j| @grid[j][i] = mark }
    #     end
    # end
end