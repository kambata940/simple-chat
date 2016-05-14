module PokerModels
  class Move < ActiveRecord::Base
    belongs_to :stage, polymorphic: true
    belongs_to :user
  end
end
