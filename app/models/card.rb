class Card < ActiveRecord::Base
  NUMBER_RANGE = (1..14).freeze

  validates :color, uniqueness: { scope: [:number] }
  validates :number, inclusion: NUMBER_RANGE

  enum color: { spade: 'spade', club: 'club', heart: 'heart', diamond: 'diamond' }
end
