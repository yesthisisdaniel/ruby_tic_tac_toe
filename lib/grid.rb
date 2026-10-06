require "colorize"

class Grid 
    attr_accessor :grid, :new_grid, :win_cons
    def initialize()
        @grid = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
        @win_cons =  [[1, 2, 3], [1, 5, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [4, 5, 6], [7, 8, 9], [3, 5, 7]]
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

    def winner?()
        @win_cons.any? do |match|
            values = match.map { |index| @grid[index - 1] }
            if values.uniq.length == 1 && values.uniq.first.nil?
            end
        end
    end

end