module PokerGame
  class Player
    attr_reader :user_id, :cards

    def initialize(user_id, cards)
      @user_id = user_id
      @cards = cards
      @active = true
    end
  end
end
