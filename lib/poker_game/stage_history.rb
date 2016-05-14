module PokerGame
  class StageHistory
    attr_reader :highest_bet

    def initialize(stage)
      @stage = stage
      @moves = []
      @highest_bet = stage.default_bet
    end

    def <<(move)
      @highest_bet = move.bet if highest_bet < move.bet
      @moves << move
    end
  end
end
