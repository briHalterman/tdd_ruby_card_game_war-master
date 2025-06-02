require_relative '../lib/playing_card'

describe 'PlayingCard' do
  it 'should initialize with a rank and suit' do
    card = PlayingCard.new('A', 'H')

    expect(card.rank).to eq('A')
    expect(card.suit).to eq('H')
  end

  it 'should be a valid suit' do
    expect{
      PlayingCard.new('A', 'X')
    }.to raise_error
  end

  it 'should be a valid rank' do
    expect{
      PlayingCard.new('X', 'H')
  }.to raise_error
  end

  it 'correctly compare two cards of the same rank and suit' do
    card1 = PlayingCard.new('A', 'H')
    card2 = PlayingCard.new('A', 'H')
    expect(card1).to eq card2
  end
end
