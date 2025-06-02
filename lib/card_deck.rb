require_relative 'playing_card'

class CardDeck
  attr_accessor :cards, :cards_left

  def initialize
    @cards = []

    PlayingCard::SUIT.flat_map do |suit|
      PlayingCard::RANK.map do |rank|
        cards.push(PlayingCard.new(rank, suit))
      end
    end
  end

  def cards_left
    cards
  end

  def deal
    cards.pop
  end

  def shuffle
    cards.shuffle!
  end

  def ==(other_deck)
    cards == other_deck.cards
  end
end
