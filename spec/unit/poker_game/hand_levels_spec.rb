require 'rails_helper'
require "#{Rails.root}/lib/poker_game/hand_levels"

RSpec.describe PokerGame::HandLevels do
  subject(:level) { described_class.new(cards) }
  let(:other_level) { described_class.new(other_cards) }

  describe PokerGame::HandLevels::HighCard do
    describe '#<=>' do
      let(:cards)       { PokerGame::Cards.parse('3c, 5h, 11h, 12c, 2d') }
      let(:other_cards) { PokerGame::Cards.parse('4d, 5h, 11c, 12d, 2h') }

      it do
        expect(level <=> other_level).to eq(-1)
      end
    end
  end

  describe PokerGame::HandLevels::OnePair do
    describe '.owns?' do
      context 'hand with exactly one pair' do
        it do
          expect(described_class)
            .to be_owns(PokerGame::Cards.parse('4h, 4h, 11h, 10h, 12d'))
        end
      end

      context 'hand with two pairs' do
        it do
          expect(described_class)
            .to be_owns(PokerGame::Cards.parse('4d, 4d, 11d, 11d, 12c'))
        end
      end

      context 'hand with high card' do
        it do
          expect(described_class)
            .not_to be_owns(PokerGame::Cards.parse('4d, 5h, 7s, 11d, 14d'))
        end
      end
    end

    describe '#<=>' do
      let(:cards)       { PokerGame::Cards.parse('4d, 5c, 11d, 12c, 12d') }
      let(:other_cards) { PokerGame::Cards.parse('2c, 5d, 11c, 12d, 12c') }

      it do
        expect(level <=> other_level).to eq(1)
      end
    end
  end

  describe PokerGame::HandLevels::TwoPairs do
    describe '.owns?' do
      context 'hand with two pairs' do
        it do
          expect(described_class)
            .to be_owns(PokerGame::Cards.parse('4c, 4c, 11c, 11c, 12d'))
        end
      end

      context 'hand with exactly one pair' do
        it do
          expect(described_class)
            .not_to be_owns(PokerGame::Cards.parse('4d, 4d, 11d, 10d, 12c'))
        end
      end
    end

    describe '#<=>' do
      let(:cards)       { PokerGame::Cards.parse('4d, 11d, 11c, 12d, 12c') }
      let(:other_cards) { PokerGame::Cards.parse('2d, 11h, 11s, 12d, 12s') }

      it do
        expect(level <=> other_level).to eq(1)
      end
    end
  end

  describe PokerGame::HandLevels::ThreeOfAKind do
    describe '.owns?' do
      context 'hand with three of a kind' do
        it do
          expect(described_class)
            .to be_owns(PokerGame::Cards.parse('4s, 3s, 11s, 11s, 11c'))
        end
      end

      context 'hand with `FullHouse`' do
        it do
          expect(described_class)
            .to be_owns(PokerGame::Cards.parse('4c, 4c, 11c, 11d, 11h'))
        end
      end

      context 'hand with two pairs' do
        it do
          expect(described_class)
            .not_to be_owns(PokerGame::Cards.parse('4c, 4c, 11c, 10c, 11h'))
        end
      end
    end

    describe '#<=>' do
      let(:cards)       { PokerGame::Cards.parse('4d, 10d, 12d, 12c, 12s') }
      let(:other_cards) { PokerGame::Cards.parse('2d, 9d, 11d, 11s, 11h') }

      it do
        expect(level <=> other_level).to eq(1)
      end
    end
  end

  describe PokerGame::HandLevels::Straight do
    describe '.owns?' do
      context 'where all cards аre consecutive' do
        it do
          expect(described_class)
            .to be_owns(PokerGame::Cards.parse('4d, 3d, 5d, 6d, 2c'))
        end
      end

      context 'cards with `StraightFlush`' do
        it do
          expect(described_class)
            .to be_owns(PokerGame::Cards.parse('4d, 3d, 5d, 6d, 7d'))
        end
      end

      context 'where all cards аre consecutive, but there is a pair' do
        it do
          expect(described_class)
            .not_to be_owns(PokerGame::Cards.parse('4d, 4d, 2d, 3d, 5h'))
        end
      end
    end

    describe '#<=>' do
      let(:cards)       { PokerGame::Cards.parse('4d, 5c, 6s, 8d, 7s') }
      let(:other_cards) { PokerGame::Cards.parse('5s, 6d, 7d, 9d, 8c') }

      it do
        expect(level <=> other_level).to eq(-1)
      end
    end
  end

  describe PokerGame::HandLevels::Flush do
    describe '.owns?' do
      context 'when all cards аre with the same color' do
        it do
          expect(described_class)
            .to be_owns(PokerGame::Cards.parse('4d, 3d, 5d, 6d, 2d'))
        end
      end

      context 'cards with `StraightFlush`' do
        it do
          expect(described_class)
            .to be_owns(PokerGame::Cards.parse('4d, 3d, 5d, 6d, 7d'))
        end
      end

      context 'when all cards аre not with the same color' do
        it do
          expect(described_class)
            .not_to be_owns(PokerGame::Cards.parse('4d, 4h, 2d, 3d, 5d'))
        end
      end
    end

    describe '#<=>' do
      let(:cards)       { PokerGame::Cards.parse('4s, 5s, 6s, 11s, 12s') }
      let(:other_cards) { PokerGame::Cards.parse('4d, 5d, 7d, 11d, 12d') }

      it do
        expect(level <=> other_level).to eq(-1)
      end
    end
  end

  describe PokerGame::HandLevels::FullHouse do
    describe '.owns?' do
      context "when it's a `FullHouse`" do
        it do
          expect(described_class)
            .to be_owns(PokerGame::Cards.parse('10d, 10d, 10d, 8c, 8s'))
        end
      end

      context "when it isn't `FullHouse`" do
        it do
          expect(described_class)
            .not_to be_owns(PokerGame::Cards.parse('10d, 10d, 10d, 8c, 9s'))
        end
      end
    end

    describe '#<=>' do
      let(:cards)       { PokerGame::Cards.parse('10d, 10h, 10c, 11d, 11h') }
      let(:other_cards) { PokerGame::Cards.parse('8d, 8h, 8c, 12d, 12h') }

      it do
        expect(level <=> other_level).to eq(1)
      end
    end
  end

  describe PokerGame::HandLevels::FourOfAKind do
    describe '.owns?' do
      context 'when there are four of a kind cards' do
        it do
          expect(described_class)
            .to be_owns(PokerGame::Cards.parse('10h, 10c, 10s, 10d, 8d'))
        end
      end

      context "when there aren't four of a kind cards" do
        it do
          expect(described_class)
            .not_to be_owns(PokerGame::Cards.parse('10d, 10c, 10d, 8s, 8c'))
        end
      end
    end

    describe '#<=>' do
      let(:cards)       { PokerGame::Cards.parse('10h, 10d, 10c, 10s, 11h') }
      let(:other_cards) { PokerGame::Cards.parse('8d, 8s, 8c, 8h, 12h') }

      it do
        expect(level <=> other_level).to eq(1)
      end
    end
  end

  describe PokerGame::HandLevels::StraightFlush do
    describe '.owns?' do
      context 'when the cards makes `StraightFlush`' do
        it do
          expect(described_class)
            .to be_owns(PokerGame::Cards.parse('10s, 12s, 11s, 9s, 8s'))
        end
      end

      context 'when the cards makes `Straight`' do
        it do
          expect(described_class)
            .not_to be_owns(PokerGame::Cards.parse('10s, 12d, 11c, 9d, 8d'))
        end
      end

      context 'when the cards makes `Flush`' do
        it do
          expect(described_class)
            .not_to be_owns(PokerGame::Cards.parse('2d, 12d, 3d, 11d, 4d'))
        end
      end
    end

    describe '#<=>' do
      let(:cards)       { PokerGame::Cards.parse('10s, 12s, 11s, 9s, 8s') }
      let(:other_cards) { PokerGame::Cards.parse('9s, 11s, 10s, 8s, 7s') }

      it do
        expect(level <=> other_level).to eq(1)
      end
    end
  end
end
