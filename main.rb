require_relative "lib/grid"
require_relative "lib/game"
require_relative "lib/player"

def create_player()
    puts "What is your name?"
    name = gets.chomp
    return Player.new("human", name)
end

def get_player_types()
    create_player()
    puts "Will player 2 be a computer?"
    input = gets.chomp
    
    if input == "yes"
        puts "Player 2 will be the computer."
        player2 = Player.new("computer", "computer")
    else
        create_player()
    end
    return 
end
get_player_types()
