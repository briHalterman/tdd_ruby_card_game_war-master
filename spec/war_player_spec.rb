require_relative '../lib/war_player'
require_relative '../lib/war_game'
require_relative '../lib/playing_card'

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

    it 'should play the top card from the player\'s stack' do
      game = WarGame.new
      game.deal_out_deck
      preplay_stack = game.player1.player_stack.dup
      card = game.player1.play_card

      expect(card).to eq preplay_stack[-1]
    end
  end

  describe 'take_stack' do
    it 'add the cards from the middle stack to the player' do
      game = WarGame.new
      game.middle_stack = [PlayingCard.new('A', 'H'), PlayingCard.new('10', 'C')]
      game.player1.player_stack = []
      game.player1.take_stack(game.middle_stack)
      expect(game.player1.player_stack.count).to eq 2
    end

    it 'should clear the middle stack' do
      game = WarGame.new
      game.middle_stack = [PlayingCard.new('A', 'H'), PlayingCard.new('10', 'C')]
      game.player1.player_stack = []
      game.player1.take_stack(game.middle_stack)

      expect(game.middle_stack.count).to eq 0
    end
  end
end
