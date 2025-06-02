require_relative 'playing_card'

class CardDeck
  attr_accessor :cards
  attr_accessor :cards_left

  def initialize
    @cards = []
    52.times do
      cards.push(PlayingCard.new('A', 'H'))
    end
  end

  def cards_left
    cards
  end

  def deal
    cards.pop
  end
end
