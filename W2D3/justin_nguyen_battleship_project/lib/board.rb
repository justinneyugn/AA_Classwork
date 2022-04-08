class Board
    attr_reader :size

    def initialize(n)
        @grid = Array.new(n) { |i| Array.new(n) { |i| :N}}
        @size = n * n 
    end

    def [](arr)
        @grid[arr[0]][arr[1]]
    end

    def []=(position, value)
        @grid[position[0]][position[1]] = value
    end

    def num_ships
        counter = 0

        @grid.each_with_index do |sub, i|
            @grid.each_with_index { |ele, j| counter += 1 if @grid[i][j] == :S }
        end

        counter
    end

    def attack(position)
        if self.[](position) == :S
            self.[]=(position, :H)
            puts "you sunk my battleship"
            return true
        else
            self.[]=(position, :X)
            return false
        end
    end

    def place_random_ships
        set_count = (@size * 0.25).to_i
        i = 1
        already_set = true

        while i <= set_count
            while already_set
                row = rand(0...@size**0.5)
                column = rand(0...@size**0.5)
                position = [row,column]
                if self.[](position) != :S
                    self.[]=(position, :S)
                    already_set = false
                end
            end
            already_set = true
            i += 1
        end
    end

    def hidden_ships_grid
        hidden = Array.new(@size**0.5) {Array.new(@size**0.5)}

        @grid.each_with_index do |sub, i|
            @grid.each_with_index do |ele, j|
                if @grid[i][j] == :S || @grid[i][j] == :N
                    hidden[i][j] = :N
                else
                    hidden[i][j] = :X
                end
            end
        end

        hidden
    end

    def self.print_grid(arr)
        puts arr.map { |x| x.join(' ')}
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end
end
