require "colorize"

class Grid 
    attr_accessor :grid, :new_grid
    def initialize()
        @grid = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
    end

    def print_grid()
        @new_grid = @grid.each_slice(3).to_a.map { |row| row.map { |cell| cell.to_s.center(3) }.join(" | ").magenta }
        @new_grid = new_grid.join("\n---------------\n").magenta
        puts new_grid
    end

    def update_grid(index, mark)
        if @grid[index] != nil
            return false
        else
            @grid[index] = mark
            return true
        end
    end

end