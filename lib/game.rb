require_relative "grid"
require_relative "player"

class Game
    def initialize(player1, player2, grid)
        @player1 = player1
        @player2 = player2
        @grid = grid
    end

    def play_game()
        loop do
            puts "Your move, #{@current_player}."
            if @grid.winner?()
                break
            end
        end
    end

   def get_starting_player()
    number = rand(2)

    if number == 1
        puts "#{@player1.name} will go first."
        @current_player = @player1.name
    else
        puts "#{@player2.name} will go first."
        @current_player = @player2.name
    end
    end

end
