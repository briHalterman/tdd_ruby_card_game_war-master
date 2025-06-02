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

    expect(deck.cards.map(&:suit)).to include('C')
    expect(deck.cards.map(&:suit)).to include('D')
    expect(deck.cards.map(&:suit)).to include('H')
    expect(deck.cards.map(&:suit)).to include('S')
  end

  it 'should include every rank' do
    deck = CardDeck.new

    PlayingCard::RANK.each do |rank|
      expect(deck.cards.map(&:rank)).to include(rank)
    end
  end

  it 'Should have 52 cards when created' do
    deck = CardDeck.new
    expect(deck.cards_left.count).to eq 52
  end

  it 'should remove a dealt card from the deck' do
    deck = CardDeck.new
    card = deck.deal
    expect(card).to_not be_nil

    expect(deck.cards.count).to eq 51
  end

  it 'should deal the top card from the deck' do
    deck1 = CardDeck.new
    deck2 = CardDeck.new

    card = deck1.deal

    expect(card).to eq deck2.cards[-1]
  end

  it 'should shuffle the deck' do
    stable_deck = CardDeck.new
    shuffle_deck = CardDeck.new
    expect(stable_deck).to eq shuffle_deck
    shuffle_deck.shuffle
    expect(stable_deck).to_not eq shuffle_deck
  end
end
