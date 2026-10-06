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

    def get_other_player()
     if @current_player == @player1
        @other_player = @player2
     else
        @other_player = @player1
     end
    end

    def assign_marks(player, mark)
     other_mark = mark == "X" ? "O" : "X"
     player.mark = mark
     @other_player.mark = other_mark
    end

   def get_player_marks()
    get_other_player()
    
    if @current_player.type == "computer"
      number = rand(2)
      if number == 0
        assign_marks(@current_player, "X")
        assign_marks(@other_player, "O")
      else
        assign_marks(@current_player, "O")
        assign_marks(@other_player, "X")
      end
      return
    end
        puts "#{@current_player.name}, choose your mark."
        loop do
            inputted_mark = gets.chomp.upcase

            if !["X", "O"].include?(inputted_mark)
                puts "Invalid input, try again."
            else
                @current_player.mark = inputted_mark
                assign_marks(@other_player, inputted_mark)
                break
            end
        end
   end
end
