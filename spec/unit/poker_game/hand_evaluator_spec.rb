require 'rails_helper'
require "#{Rails.root}/lib/poker_game/hand_evaluator"
require "#{Rails.root}/lib/poker_game/cards"
require "#{Rails.root}/lib/poker_game/player"

RSpec.describe PokerGame::HandEvaluator do

  let(:winner) { PokerGame::Player.new(3, PokerGame::Cards.parse('9d, 10d')) }

  let(:players) do
    [
      PokerGame::Player.new(1, PokerGame::Cards.parse('14d, 14s')),
      PokerGame::Player.new(2, PokerGame::Cards.parse('2d, 2s')),
      winner,
      PokerGame::Player.new(4, PokerGame::Cards.parse('13h, 14h')),
      PokerGame::Player.new(5, PokerGame::Cards.parse('5h, 5d'))
    ]
  end

  let(:board) { PokerGame::Cards.parse('3d, 4d, 14c,  6d,  7h') }

  it '#find_winner' do
    evaluator = described_class.new(players, board)
    expect(evaluator.find_winner).to eq winner
  end
end
