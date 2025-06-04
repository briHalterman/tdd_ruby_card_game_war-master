require_relative 'card_deck'
require_relative 'playing_card'
require_relative 'war_player'

class WarGame
  attr_accessor :player1, :player2, :deck, :middle_stack, :deal, :cards, :round_winner

  FULL_DECK_COUNT = 52

  def initialize
    @player1 = WarPlayer.new('Player1')
    @player2 = WarPlayer.new('Player2')
    @deck = CardDeck.new
    @middle_stack = []
  end

  def start
    deck.shuffle!
    deal_out_deck
  end

  def deal_card(player)
    player.player_stack.push(deck.deal)
  end

  def deal_out_deck
    while deck.cards.count > 0 do
      deal_card(player1)
      deal_card(player2)
    end
  end

  def play_turn(player)
    card = player.play_card
    middle_stack.unshift(card)
    card
  end

  def play_round
    player1_card = play_turn(player1)
    player2_card = play_turn(player2)

    if player1_card.value > player2_card.value
      player1.player_stack.unshift(*middle_stack)
      middle_stack.clear
    elsif player2_card.value > player1_card.value
      player2.player_stack.unshift(*middle_stack)
      middle_stack.clear
    end

  end


end
