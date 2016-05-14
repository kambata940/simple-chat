module PokerModels
  class PokerTable < ActiveRecord::Base
    has_one :chat_room
    has_many :hand_histories
  end
end
