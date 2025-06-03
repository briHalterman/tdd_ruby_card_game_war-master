require_relative '../lib/war_game'

describe 'WarGame' do
  let(:game) { WarGame.new }

  describe 'initialize' do
    it 'initializes a game with a deck' do
      expect(game.deck).to respond_to :cards
    end

    it 'initializes a game with two players' do
      expect(game.player1).to be_a WarPlayer
      expect(game.player2).to be_a WarPlayer
    end

    it 'initializes with an empty middle stack' do
      expect(game.middle_stack).to be_empty
    end
  end

  describe 'deal_card' do
    it 'deals a card to a player' do
      game.deal_card(game.player1)

      expect(game.player1.player_stack.count).to eq 1
    end
  end

  describe 'deal_out_deck' do
    it 'deals out 26 cards to each players' do
      game.deal_out_deck

      expect(game.player1.player_stack.count).to eq FULL_DECK_COUNT / 2
      expect(game.player2.player_stack.count).to eq FULL_DECK_COUNT / 2
    end

    it 'deals the entire deck' do
      game.deal_out_deck

      expect(game.deck.cards.count).to eq 0
    end

    it 'alternates deals' do
      predealt_deck = game.deck.cards.dup
      game.deal_out_deck

      expect(game.player1.player_stack[0]).to eq predealt_deck[-1]
      expect(game.player2.player_stack[0]).to eq predealt_deck[-2]
      expect(game.player1.player_stack[1]).to eq predealt_deck[-3]
      expect(game.player2.player_stack[1]).to eq predealt_deck[-4]
    end
  end

  describe 'play_turn' do
    it 'plays a card from a player\'s stack' do
      game.deal_out_deck
      preplay_stack_count = game.player1.player_stack.count
      game.play_turn(game.player1)

      expect(game.player1.player_stack.count).to eq preplay_stack_count - 1
    end

    it 'adds the played card to the middle stack' do
    end
  end

  # describe 'play_round' do
  #   it 'plays a card from player1' do

  #   end

  #   it 'plays a card from player2' do

  #   end

  #   it 'gives the cards to the player with a higher rank'

  #   end

  #   it 'deals another card from each player in the case of a tie' do

  #   end
  # end
end
