module PokerGame
  module Play
    module_function

    def call(player, current_highest_bet)
      data = required_data(player, current_highest_bet)
      id = UIstub.play_request(:start, data)
      sleep 30
      # {
      #   player_id: p_id,
      #   action: fold/call/raise,
      #   bet: X
      # }
      response = UIstub.play_response(:end, id)
      Move.new(player, response)
    end

    def required_data(player, current_highest_bet)
      call_amount = current_highest_bet - player.currrent_bet
      min_raise_amount =
        if player.maximum_bet < 2 * current_highest_bet
          player.maximum_bet
        else
          2 * current_highest_bet
        end

      OpenStruct.new(player: player,
                     call_amount: call_amount,
                     min_raise_amount: min_raise_amount)
    end
  end
end
