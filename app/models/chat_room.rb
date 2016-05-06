class ChatRoom < ActiveRecord::Base
  has_many :messages, dependent: :delete_all
  belongs_to :poker_table

  validates :name, presence: true
end
