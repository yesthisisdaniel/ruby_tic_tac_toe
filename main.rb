require_relative "lib/grid"
require_relative "lib/game"
require_relative "lib/player"
require "colorize"

def create_player()
    puts "What is your name?"
    name = gets.chomp
    return Player.new("human", name)
end

def game_greeting(player1, player2)
    if player1.type == "human"
        puts "Welcome, #{player1.name}!".green
    end
    if player2.type == "computer"
        puts "You will be facing the computer.".blue
    elsif player2.type == "human"
        puts "Welcome, #{player2.name}!".blue
    end 
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
    game_greeting(player1, player2)
    return player1, player2
end

player1, player2 = get_player_types()
game_grid = Grid.new
new_game = Game.new(player1, player2, game_grid)
new_game.get_starting_player()
game_grid.print_grid()

