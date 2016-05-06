module PokerModels
  class HandPlayer < ActiveRecord::Base
    belongs_to :hand_history
    belongs_to :user
  end
end
