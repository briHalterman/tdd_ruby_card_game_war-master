require_relative 'playing_card'

class CardDeck
  attr_accessor :cards, :cards_left

  FULL_DECK_COUNT = 52

  def initialize
    @cards = build_deck
  end

  def build_deck
    PlayingCard::SUIT.flat_map do |suit|
      PlayingCard::RANK.map do |rank|
        PlayingCard.new(rank, suit)
      end
    end
  end

  def cards_left
    cards.count
  end

  def deal
    cards.pop
  end

  def shuffle!
    cards.shuffle!
  end

  def ==(other_deck)
    cards == other_deck.cards
  end
end
