class WarGame
  attr_accessor :player1, :player2, :deck

  def initialize
    @player1 = WarPlayer.new('Player1')
    @player2 = WarPlayer.new('Player2')
    @deck = CardDeck.new
  end

end
