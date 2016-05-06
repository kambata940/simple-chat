module PokerModels
  class HandHistory < ActiveRecord::Base
    belongs_to :poker_table
    has_many :hand_players
    has_one :preflop
    has_one :flop
    has_one :turn
    has_one :river
  end
end
