require 'rails_helper'
require "#{Rails.root}/lib/poker_game/hand_index"

RSpec.describe PokerGame::HandIndex do
  let(:high_card) { PokerGame::Cards.parse('2s, 4d, 5c, 7d, 11d') }
  let(:one_pair) { PokerGame::Cards.parse('2s, 2d, 5c, 7d, 11d') }
  let(:two_pairs) { PokerGame::Cards.parse('2s, 2d, 5c, 7d, 7d') }
  let(:three_of_a_kind) { PokerGame::Cards.parse('2s, 2d, 2c, 8d, 7d') }
  let(:straight) { PokerGame::Cards.parse('5s, 6d, 9c, 8d, 7d') }
  let(:flush) { PokerGame::Cards.parse('2s, 6s, 10s, 8s, 7s') }
  let(:full_house) { PokerGame::Cards.parse('2s, 2d, 2c, 8d, 8s') }
  let(:four_of_a_kind) { PokerGame::Cards.parse('2s, 2d, 2c, 2h, 8s') }
  let(:straight_flush) { PokerGame::Cards.parse('5d, 6d, 9d, 8d, 7d') }

  let(:levels_sorted_by_strength) do
    [
      high_card,
      one_pair,
      two_pairs,
      three_of_a_kind,
      straight,
      flush,
      full_house,
      four_of_a_kind,
      straight_flush
    ]
  end

  describe '#<=>' do
    context 'when compare high card' do
      it do
        expect(described_class.new(high_card) <=> described_class.new(high_card))
          .to eq(0)

        levels_sorted_by_strength[1..9].each do |higher_hand|
          expect(described_class.new(high_card) <=> described_class.new(higher_hand))
            .to eq(-1)
        end
      end
    end

    context 'when compare one pair' do
      it do
        expect(described_class.new(one_pair) <=> described_class.new(one_pair))
          .to eq(0)

        levels_sorted_by_strength[2..-9].each do |higher_hand|
          expect(described_class.new(one_pair) <=> described_class.new(higher_hand))
            .to eq(-1)
        end
      end
    end

    context 'when compare two pairs' do
      it do
        expect(described_class.new(two_pairs) <=> described_class.new(two_pairs))
          .to eq(0)

        levels_sorted_by_strength[3..9].each do |higher_hand|
          expect(described_class.new(two_pairs) <=> described_class.new(higher_hand))
            .to eq(-1)
        end
      end
    end

    context 'when compare three of a kind' do
      it do
        expect(described_class.new(three_of_a_kind) <=> described_class.new(three_of_a_kind))
          .to eq(0)

        levels_sorted_by_strength[4..9].each do |higher_hand|
          expect(described_class.new(three_of_a_kind) <=> described_class.new(higher_hand))
            .to eq(-1)
        end
      end
    end

    context 'when compare straight' do
      it do
        expect(described_class.new(straight) <=> described_class.new(straight))
          .to eq(0)

        levels_sorted_by_strength[5..9].each do |higher_hand|
          expect(described_class.new(straight) <=> described_class.new(higher_hand))
            .to eq(-1)
        end
      end
    end

    context 'when compare flush' do
      it do
        expect(described_class.new(flush) <=> described_class.new(flush))
          .to eq(0)

        levels_sorted_by_strength[6..9].each do |higher_hand|
          expect(described_class.new(flush) <=> described_class.new(higher_hand))
            .to eq(-1)
        end
      end
    end

    context 'when compare full_house' do
      it do
        expect(described_class.new(full_house) <=> described_class.new(full_house))
          .to eq(0)

        levels_sorted_by_strength[7..9].each do |higher_hand|
          expect(described_class.new(full_house) <=> described_class.new(higher_hand))
            .to eq(-1)
        end
      end
    end

    context 'when compare four_of_a_kind' do
      it do
        expect(described_class.new(four_of_a_kind) <=> described_class.new(four_of_a_kind))
          .to eq(0)

        levels_sorted_by_strength[8..9].each do |higher_hand|
          expect(described_class.new(four_of_a_kind) <=> described_class.new(higher_hand))
            .to eq(-1)
        end
      end
    end

    context 'when compare straight flush' do
      it do
        expect(described_class.new(straight_flush) <=> described_class.new(straight_flush))
          .to eq(0)
      end
    end
  end

  describe 'it is sorted corectly' do
    it do
      sorted_collection = levels_sorted_by_strength.map do |cards|
        described_class.new(cards)
      end

      expect(sorted_collection.reverse.sort).to eq sorted_collection
    end
  end
end
