module PokerGame
  class Preflop < Stage
    def post_initialize
      data = OpenStruct.new(players, pot: 0)
      PokerController.stage_start(:preflop, data)
    end

    # Possible moves
    # `Call` X money
    # `Raise` X money
    # `Fold`. The player is over with the hand.
    def runner
      @runner ||= Fiber.new do
          players_cycle.each do
            move_id = Play.call(hand: hand, current_player: current_player, players: active_players)

            move = Fiber.yield move_id
          end
        end
      end
    end

    private

    def normalize_players(players)
      players.map do |player|
        player.activate(deck.take(2))
      end
    end

    def active_players
      @initial_players - @folded_players
    end

    def highest_bet
      OpenStruct.new(user_id: @active_players.last.user_id,
                     amount: hand.big_blind)
    end

    def bet_leader?(player)
      highest_bet.player.user_id == player.user_id
    end

    def players_cycle
      Enumerator.new do |yielder|
        inner_cycle = @initial_players
                      .lazy
                      .cycle
                      .select do |current_player|
                        @active_players.include?(current_player)
                      end

        while active_players.count > 1
          inner_cycle.next
          yielder <<
        end
      end
    end
  end
end
