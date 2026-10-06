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
        @current_player = @player1
    else
        puts "#{@player2.name} will go first."
        @current_player = @player2
    end
   end

   def get_player_marks()
        puts "#{@current_player.name}, choose your mark."
        inputted_mark = gets.chomp.upcase
        loop do
            if inputted_mark != "X" || if inputted_mark != "O"
                puts "Invalid input, try again."
            else
                @current_player.mark = inputted_mark
            end
        end
    end

end
