require_relative 'playing_card'

class CardDeck
  attr_accessor :cards, :cards_left

  def initialize
    @cards = []

    # 52.times do
    #   cards.push(PlayingCard.new('A', 'H'))
    # end

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
end
