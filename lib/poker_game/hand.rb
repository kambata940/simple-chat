module PokerGame
  class Hand
    attr_reader :game, :players, :current_stage

    STAGES = [Preflop, Flop, Turn, River].to_enum

    alias_method :start, :start_new_stage

    def initialize(table)
      @table = table
      next_stage
    end

    def runner
      current_stage.runner
    end

    def start_new_stage
      runner.resume
    end

    def start_new_stage(move)
      return start_stage if move.status == 'STAGE_ENDED'
      runner.resume(move)
    end

    def next_stage
      @current_stage = STAGES.next.new(table.players, dealer)
    rescue StopIteration
      table.game_ended(self)
    end

    private

    def dealer
      @dealer ||= Dealer.new(table.players.count)
    end
  end
end

# Moves

## Sended

## Recieved

# Cable
table = Table.inmemory.find(table_id)
table.engine.move_made(move)
