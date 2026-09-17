require_relative "lib/grid"
attr_accessor :new_grid
class Game
    def initialize()
        @new_grid = Grid.new
        @new_grid.print_grid
    end
end
