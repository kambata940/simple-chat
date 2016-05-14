module PokerGame
  class Stage
    def initialize(players)
      @initial_players = normalize_players(players)
      @folded_players = []
      post_initialize
    end

    def post_initialize
    end


  end
end
