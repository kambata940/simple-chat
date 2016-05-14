module PokerGame
  class Dealer
    def initialize(players_count)
      @deck = Card.all.shuffle
    end

    def player_distibution
      @deck.
      players_cards = @deck.pop(2 * players_count).reverse

      players_cards.group_by.with_index { |_, index| index % players_count }
    end

    def distribute_flop
      cards = @deck.pop(4)

      cards[1..-1]
    end

    def distribute_turn
      cards = @deck.pop(2)

      cards.last
    end

    def flow
      @flow ||= Enumerator.new do
        reversed_deck = @deck.reverse
        players_count.each do

        end
      end
    end

    alias_method :distribute_river, :distribute_turn
  end
end
