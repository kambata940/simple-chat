module PokerGame
  class Postflop
    def initialize(players)
      @players = players
    end

    def start
      players_cycle.each do |player, last|
        stage_history << player.play

        break if last && player.currrent_bet >= stage_history.highest_bet
      end
    end

    def stage_history
      @stage_history ||= StageHistory.new(self)
    end

    private

    def players_cycle
      Enmerator.new do |yielder|
        loop do
          active_players = @players.active.postflop_sort

          active_players[0..-2].each { |player| yielder.yield(player: player, last: false) }
          yielder.yield(player: player, last: true)
        end
      end
    end
  end
end
