require_relative '../lib/card_deck'

describe 'CardDeck' do
  it 'should initialize with 52 cards' do
    deck = CardDeck.new
    expect(deck.cards.count).to eq 52
  end

  it 'should initialize with unique cards' do
    deck = CardDeck.new
    expect(deck.cards.uniq(&:to_s).count).to eq 52
  end

  it 'should include every suit' do
    deck = CardDeck.new

    puts deck.cards.map(&:suit).inspect
    expect(deck.cards.map(&:suit)).to include('C')
    expect(deck.cards.map(&:suit)).to include('D')
    expect(deck.cards.map(&:suit)).to include('H')
    expect(deck.cards.map(&:suit)).to include('S')
  end

  it 'should include every rank'

  it 'Should have 52 cards when created' do
    deck = CardDeck.new
    expect(deck.cards_left.count).to eq 52
  end

  it 'should deal the top card' do
    deck = CardDeck.new
    card = deck.deal
    expect(card).to_not be_nil
    expect(deck.cards.count).to eq 51
  end
end
