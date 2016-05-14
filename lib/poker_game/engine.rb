module PokerGame
  class Engine
    attr_reader :players

    def initialize(table)
      @table = table
      @players = Players.new
    end

    def add_player(seat_number, user_id, money)
      players.add(Player.new(user_id: user_id, money: money), seat_number)
      # TODO: ...
      start_hand unless @current_hand
    end

    def remove_player(user_id)
      players.delete(user_id)
    end

    def sitout_player(user_id)
      player = players.find_by_id(user_id)
      player.sitout

      players.modify_player(player)
    end

    def start_hand
      return unless game_active?

      @current_hand = Hand.new(table: @table, players: @players)
      @current_hand.start
    end

    def hand_ended
      @current_hand
      # save HandHistory
      @current_hand = nil
    end

    def game_active?
      players.count > 2
    end
  end
end
