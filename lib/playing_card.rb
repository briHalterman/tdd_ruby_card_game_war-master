class PlayingCard
  attr_reader :rank, :suit

  SUIT = ['H', 'D', 'S', 'C']
  RANK = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

  def initialize(rank, suit)
    unless SUIT.include? suit
      raise StandardError
    end

    unless RANK.include? rank
      raise StandardError
    end

    @rank = rank
    @suit = suit
  end
end