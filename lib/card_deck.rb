class CardDeck
  def cards_left
    52.times do
      PlayingCard.new('A', 'H')
    end
  end

  def deal
    @cards_left = cards_left - 1
  end
end
