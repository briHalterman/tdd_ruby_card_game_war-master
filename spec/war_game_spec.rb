require_relative '../lib/card_deck'
require_relative '../lib/war_game'

describe 'WarGame' do
  let(:game) { WarGame.new }

  describe 'initialize' do
    it 'should initialize a game with a deck' do
      expect(game.deck).to respond_to :cards
    end

    it 'should initialize a game with two players' do
      expect(game.player1).to be_a WarPlayer
      expect(game.player2).to be_a WarPlayer
    end

    it 'should initialize with an empty middle stack' do
      expect(game.middle_stack).to be_empty
    end
  end

  describe 'start' do
    it 'should shuffle the deck' do
      preshuffled_deck = CardDeck.new.dup
      expect(game.deck).to eq preshuffled_deck

      game.start
      expect(game.deck).to_not eq preshuffled_deck
    end

    it 'should deal out the deck to players' do
      game.start

      expect(game.deck.cards).to be_empty
      expect(game.player1.player_stack.count).to eq CardDeck::FULL_DECK_COUNT / 2
      expect(game.player2.player_stack.count).to eq CardDeck::FULL_DECK_COUNT / 2
    end
  end

  describe 'deal_card' do
    it 'should deal a card to a player' do
      game.deal_card(game.player1)

      expect(game.player1.player_stack.count).to eq 1
    end
  end

  describe 'deal_out_deck' do
    it 'should deal out 26 cards to each players' do
      game.deal_out_deck

      expect(game.player1.player_stack.count).to eq CardDeck::FULL_DECK_COUNT / 2
      expect(game.player2.player_stack.count).to eq CardDeck::FULL_DECK_COUNT / 2
    end

    it 'should deal the entire deck' do
      game.deal_out_deck

      expect(game.deck.cards.count).to eq 0
    end

    it 'should alternate deals' do
      predealt_deck = game.deck.cards.dup
      game.deal_out_deck

      expect(game.player1.player_stack[0]).to eq predealt_deck[-1]
      expect(game.player2.player_stack[0]).to eq predealt_deck[-2]
      expect(game.player1.player_stack[1]).to eq predealt_deck[-3]
      expect(game.player2.player_stack[1]).to eq predealt_deck[-4]
    end
  end

  describe 'winner' do
    it 'should identify if a player is out of cards'

    it 'should assign the player who is not out of cards as the game winner'
  end

  describe 'play_turn' do
    it 'should play a card from a player\'s stack' do
      game.deal_out_deck
      preplay_player_stack_count = game.player1.player_stack.count
      game.play_turn(game.player1)

      expect(game.player1.player_stack.count).to eq preplay_player_stack_count - 1
    end

    it 'should add the played card to the middle stack' do
      game.deal_out_deck
      preplay_middle_stack_count = game.middle_stack.count
      game.play_turn(game.player1)

      expect(game.middle_stack.count).to eq preplay_middle_stack_count + 1
    end
  end

  describe 'shuffle_middle_stack' do
    it 'should shuffle the middle stack' do
      unshuffled_stack = [PlayingCard.new('A', 'H'), PlayingCard.new('2', 'S'), PlayingCard.new('4', 'C')]
      game.middle_stack = [PlayingCard.new('A', 'H'), PlayingCard.new('2', 'S'), PlayingCard.new('4', 'C')]
      # shuffle_stack = game.middle_stack.dup
      expect(game.middle_stack).to eq unshuffled_stack
      game.shuffle_middle_stack!
      expect(game.middle_stack).to_not eq unshuffled_stack
    end
  end

  describe 'award_stack' do
    it 'should give the middle stack to the round winner' do
      game.player1_card = PlayingCard.new('A', 'H')
      game.player2_card = PlayingCard.new('K', 'H')
      game.middle_stack = [game.player1_card, game.player2_card]
      game.award_stack(game.player1_card, game.player2_card)

      expect(game.player1.player_stack.count).to eq 2
      expect(game.player2.player_stack.count).to eq 0
    end
  end

  describe 'tied_round_message' do
    it 'should display if there is a tie'

    it 'should state the rank of the cards that tie'
  end

  describe 'round_winner_message' do
    it 'should display the winning player\'s name'

    it 'should display the winning card\'s rank'

    it 'should display the winning card\'s suit'
  end

  describe 'play_round' do
    it 'should only runner if there is no winner'

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

    it 'should shuffle the middle stack before giving it to a player'

    it 'should add the middle stack to the stack of the player who laid the higher value suit' do
      game.player1.player_stack = [PlayingCard.new('A', 'H')]
      game.player2.player_stack = [PlayingCard.new('K', 'H')]
      game.play_round

      expect(game.player1.player_stack.count).to eq 2
      expect(game.player2.player_stack.count).to eq 0
    end

    it 'should add the middle stack to the stack of the player who laid the higher value suit' do
      game.player1.player_stack = [PlayingCard.new('2', 'H')]
      game.player2.player_stack = [PlayingCard.new('J', 'H')]
      game.play_round

      expect(game.player1.player_stack.count).to eq 0
      expect(game.player2.player_stack.count).to eq 2
    end

    it 'should clear the middle stack after adding it to player\'s stack' do
      game.player1.player_stack = [PlayingCard.new('A', 'H')]
      game.player2.player_stack = [PlayingCard.new('K', 'H')]
      game.play_round

      expect(game.middle_stack.count).to eq 0
    end

    it 'should display a message'
  end
end
