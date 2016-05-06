module PokerModels
  class Turn < ActiveRecord::Base
    has_many :moves, as: :stage
    belongs_to :hand_history
  end
end
