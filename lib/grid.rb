class Grid 
    attr_accessor :grid
    def initialize()
        @grid = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
    end

    def print_grid()
        new_grid = @grid.each_slice(3).to_a.map { |row| row.map { |cell| cell.to_s.center(3) }.join(" | ") }
        new_grid = new_grid.join("\n---------------\n")
        puts new_grid
    end

end