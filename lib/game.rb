require_relative "grid"

class Game
    attr_accessor :new_grid
    def initialize()
        @new_grid = Grid.new
        @new_grid.print_grid
    end
end
