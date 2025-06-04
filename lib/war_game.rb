require_relative 'card_deck'
require_relative 'playing_card'
require_relative 'war_player'

class WarGame
  attr_accessor :player1, :player2, :deck, :middle_stack, :deal, :cards

  def initialize
    @player1 = WarPlayer.new('Player1')
    @player2 = WarPlayer.new('Player2')
    @deck = CardDeck.new
    @middle_stack = []
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
  end

  def play_round
    play_turn(player1)
    play_turn(player2)

    # compare card values
    # if cards have same value
      # start round over to play turn for each play
    # if player1 played higher value card
      # give stack to player1
    # if player2 played higher value card
      # give stack to player2
    #
  end
end
