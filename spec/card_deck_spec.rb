require_relative '../lib/card_deck'

describe 'CardDeck' do
  let(:deck) { CardDeck.new }

  FULL_DECK_COUNT = 52

  it 'should initialize with 52 cards' do
    expect(deck.cards.count).to eq FULL_DECK_COUNT
  end

  it 'should initialize with unique cards' do
    expect(deck.cards.uniq(&:to_s).count).to eq FULL_DECK_COUNT
  end

  it 'should include every suit' do
    PlayingCard::SUIT.each do |suit|
      expect(deck.cards.map(&:suit)).to include(suit)
    end
  end

  it 'should include every rank' do
    PlayingCard::RANK.each do |rank|
      expect(deck.cards.map(&:rank)).to include(rank)
    end
  end

  it 'Should have 52 cards when created' do
    expect(deck.cards_left).to eq FULL_DECK_COUNT
  end

  it 'should remove a dealt card from the deck' do
    card = deck.deal
    expect(card).to_not be_nil

    expect(deck.cards_left).to eq FULL_DECK_COUNT - 1
  end

  it 'should deal the top card from the deck' do
    deck1 = CardDeck.new
    deck2 = CardDeck.new

    card = deck1.deal

    expect(card).to eq deck2.cards[-1]
  end

  it 'should deal a different card on each deal' do
    card1 = deck.deal
    card2 = deck.deal
    expect(card1).to_not eq card2
  end

  it 'should shuffle the deck' do
    stable_deck = CardDeck.new
    shuffle_deck = CardDeck.new
    expect(stable_deck).to eq shuffle_deck
    shuffle_deck.shuffle
    expect(stable_deck).to_not eq shuffle_deck
  end
end
