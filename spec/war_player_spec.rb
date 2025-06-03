require_relative '../lib/war_player'
require_relative 'war_game_spec'

describe 'WarPlayer' do
  describe 'initialize' do
    it 'initializes with a name' do
      player = WarPlayer.new('PlayerX')

      puts @player
      expect(player.name).to eq 'PlayerX'
    end

    it 'initializes with an empty stack' do
      player = WarPlayer.new('PlayerX')

      expect(player.player_stack).to be_empty
    end
  end

  describe 'play_card' do
    it 'should remove a played card from the player\'s stack' do
      game = WarGame.new
      game.deal_out_deck

      stack_count =  game.player1.player_stack.count
      card = game.player1.play_card
      expect(card).to_not be_nil

      expect(game.player1.player_stack.count).to eq stack_count - 1
    end

    it 'should deal the top card from the deck' do
      game = WarGame.new
      game.deal_out_deck
      preplay_stack = game.player1.player_stack.dup
      # puts preplay_stack
      card = game.player1.play_card
      puts preplay_stack.count
      puts preplay_stack
      puts card

      expect(card).to eq preplay_stack[-1]
    end
  end
end
