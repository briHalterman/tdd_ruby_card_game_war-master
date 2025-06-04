require_relative '../lib/card_deck'
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

  describe 'start' do
    it 'shuffles the deck' do
      preshuffled_deck = CardDeck.new.dup
      expect(game.deck).to eq preshuffled_deck

      game.start
      expect(game.deck).to_not eq preshuffled_deck
    end

    it 'deals out the deck to players' do
      game.start

      expect(game.deck.cards).to be_empty
      expect(game.player1.player_stack.count).to eq CardDeck::FULL_DECK_COUNT / 2
      expect(game.player2.player_stack.count).to eq CardDeck::FULL_DECK_COUNT / 2
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

      expect(game.player1.player_stack.count).to eq CardDeck::FULL_DECK_COUNT / 2
      expect(game.player2.player_stack.count).to eq CardDeck::FULL_DECK_COUNT / 2
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
      preplay_player_stack_count = game.player1.player_stack.count
      game.play_turn(game.player1)

      expect(game.player1.player_stack.count).to eq preplay_player_stack_count - 1
    end

    it 'adds the played card to the middle stack' do
      game.deal_out_deck
      preplay_middle_stack_count = game.middle_stack.count
      game.play_turn(game.player1)

      expect(game.middle_stack.count).to eq preplay_middle_stack_count + 1
    end
  end

  describe 'play_round' do
    it 'plays a turn for player1' do
      game.deal_out_deck
      preplay_player_stack_count = game.player1.player_stack.count
      game.play_round

      expect(game.player1.player_stack.count).to_not eq preplay_player_stack_count
    end

    it 'plays a turn for player2' do
      game.deal_out_deck
      preplay_player_stack_count = game.player2.player_stack.count
      game.play_round

      expect(game.player2.player_stack.count).to_not eq preplay_player_stack_count
    end

    it 'adds player cards to middle_stack' do
      game.deal_out_deck
      preplay_middle_stack_count = game.middle_stack.count
      game.play_round

      expect(game.middle_stack.count).to eq preplay_middle_stack_count + 2
    end

    it 'deals another card from each player in the case of a tie'

    it 'shuffles the middle stack'

    it 'gives the cards to the player with a higher rank' do
      game.player1.player_stack = [PlayingCard.new('A', 'H')]
      game.player2.player_stack = [PlayingCard.new('K', 'H')]
      game.play_round

      expect(game.player1.player_stack.count).to eq 2
      expect(game.player2.player_stack.count).to eq 0
    end

    it 'gives the cards to the player with a higher rank' do
      game.player1.player_stack = [PlayingCard.new('2', 'H')]
      game.player2.player_stack = [PlayingCard.new('J', 'H')]
      game.play_round

      expect(game.player1.player_stack.count).to eq 0
      expect(game.player2.player_stack.count).to eq 2
    end
  end
end
