class PlayingCard
  attr_reader :rank, :suit, :value

  SUIT = ['C', 'D', 'H', 'S']
  RANK = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

  def initialize(rank, suit)
    unless SUIT.include? suit
      raise StandardError, "#{suit} suit is invalid"
    end

    unless RANK.include? rank
      raise StandardError, "#{rank} rank is invalid"
    end

    @rank = rank
    @suit = suit
    @value = RANK.find_index rank
  end

  def ==(other_card)
    suit == other_card.suit &&
    rank == other_card.rank
  end

  def to_s
    "Rank: #{rank} Suit: #{suit}"
  end
end