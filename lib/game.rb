require_relative "grid"
require_relative "player"

class Game
    def initialize(player1, player2, grid)
        @player1 = player1
        @player2 = player2
        @grid = grid
    end

    def play_game()
    end

   def get_starting_player()
    number = rand(2)

    if number == 1
        puts "#{@player1.name} will go first."
    else
        puts "#{@player2.name} will go first."
    end
    end

end
