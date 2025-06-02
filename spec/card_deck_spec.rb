require_relative '../lib/card_deck'

describe 'CardDeck' do
  it 'should initialize with 52 cards' do
    deck = CardDeck.new
    expect(deck.cards.count).to eq 52
  end

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
