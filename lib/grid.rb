class Grid 
    attr_accessor :grid
    def initialize()
        @grid = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
        puts "Loaded!"
    end

    def print_grid()
        new_grid = @grid.each_slice(3).to_a.map { |row| row.join( " | " ) }
        puts new_grid
    end

end