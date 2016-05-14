module PokerGame
  class Move
    # TODO: add validations!!
    def initialize(player, response)
      # User id
      @player_id = player.id
      @action = response[:action]
      @bet = response[:bet]
    end
  end
end
