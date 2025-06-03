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
end
