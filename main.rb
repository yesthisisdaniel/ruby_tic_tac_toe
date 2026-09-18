require_relative "lib/grid"
require_relative "lib/game"
require_relative "lib/player"
require "colorize"

def create_player()
    puts "What is your name?"
    name = gets.chomp
    return Player.new("human", name)
end

def get_player_types()
    player1 = create_player()
    puts "Will player 2 be a computer?"
    input = gets.chomp
    
    if input == "yes"
        puts "Player 2 will be the computer."
        player2 = Player.new("computer", "computer")
    else
        player2 = create_player()

    end
    puts "Welcome, #{player1.name}!".colorize("blue")
    if input == "yes"
        puts "You will be facing the computer, good luck!".colorize("green")
    else
        puts "Welcome, #{player2.name}!".colorize("green")
    end
    return player1, player2
end
get_player_types()
game_grid = Grid.new
game_grid.print_grid
