class Player
    attr_accessor :name, :type, :mark
    def initialize(type_of_player, player_name)
        @name = player_name
        @type = type_of_player
    end
end