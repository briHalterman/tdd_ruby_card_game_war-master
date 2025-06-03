class WarGame
  attr_accessor :player1, :player2, :deck

  def initialize
    @player1 = WarPlayer.new('Player1')
    @player2 = WarPlayer.new('Player2')
    @deck = CardDeck.new
  end

  def deal_out_deck
    26.times do
      player1.player_stack.push(deck.deal)
      player2.player_stack.push(deck.deal)
    end
  end

  def deal_card(player)
    player.player_stack.push(deck.deal)
  end
end
