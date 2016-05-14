require "#{Rails.root}/lib/poker_game/poker_table"

class PokerProxy
  # actions: Fold, Call, Raise(size)
  def move_played(table_id, user_id, action)
    table = PokerGame::Table.find(table_id)
    PokerGame::Engine.next(poker_game, user_id)
  end

  def player_leaved

  end
end
