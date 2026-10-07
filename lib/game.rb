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
            if @current_player.type == "human"
                puts "Your move, #{@current_player.name}."
            end
            get_and_place_move()
            @grid.print_grid()
            if @grid.winner?()
                puts "#{@current_player.name} is the winner!!!!".yellow
                break
            end
            @current_player = @other_player
            get_other_player()
        end
    end

    def get_valid_number()
      if @current_player.type == "computer"
        number = rand(1..9).to_i
        return number
      end
      if @current_player.type == "human"
        number = gets.chomp.to_i
        (1..9).include?(number) ? number : nil
      end
    end

    def get_and_place_move()
      if @current_player.type == "computer"
        loop do
          computer_input = get_valid_number()

          if computer_input.nil?
            next
          end

          index = computer_input - 1
          
          if @grid.update_grid(index, @current_player.mark)
            return computer_input
          else
            next
          end
        end
      end

      if @current_player.type == "human"
        loop do
            player_input = get_valid_number()

            if player_input.nil?
                puts "Invalid input, please choose a number that corresponds with the game grid."
                next
            end

            index = player_input - 1

            if @grid.update_grid(index, @current_player.mark)
                return player_input
            else
                puts "This spot is taken, try again."
            next
            end
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
