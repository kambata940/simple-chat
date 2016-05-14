require 'rails_helper'
require "#{Rails.root}/lib/poker_game/cards"

RSpec.describe PokerGame::Cards do
  subject { described_class.parse('6s, 5h, 7h, 8h, 9h') }

  describe '.parse' do
    def card_for(number, color = nil)
      Card.where(color: color).find_by(number: number)
    end

    it 'returns new collection of cards' do
      cards = [card_for(2, 'heart'),
               card_for(3, 'heart'),
               card_for(4, 'spade'),
               card_for(5, 'club'),
               card_for(6, 'diamond')]

      expect(described_class.parse('2h, 3h, 4s, 5c, 6d'))
        .to match_array(described_class.new(cards))
    end
  end

  describe '#sorted_numbers' do
    it do
      expect(subject.sorted_numbers).to eq [5, 6, 7, 8, 9]
    end
  end

  describe '#numbers_desc_by_occurency' do
    it 'sorts correctly hand without a pair' do
      cards = described_class.parse('10s, 4s, 2d, 5d, 12d')

      expect(cards.numbers_desc_by_occurency)
        .to eq [12, 10, 5, 4, 2]
    end

    it 'sorts correctly hand with a pair' do
      cards = described_class.parse('10d, 10d, 2d, 4d, 12d')

      expect(cards.numbers_desc_by_occurency)
        .to eq [10, 10, 12, 4, 2]
    end

    it 'sorts correctly hand with two pairs' do
      cards = described_class.parse('10d, 10d, 11d, 11d, 14d')

      expect(cards.numbers_desc_by_occurency)
        .to eq [11, 11, 10, 10, 14]
    end

    it 'sorts correctly hand with a set' do
      cards = described_class.parse('10d, 10d, 10d, 13d, 14d')

      expect(cards.numbers_desc_by_occurency)
        .to eq [10, 10, 10, 14, 13]
    end
  end
end
