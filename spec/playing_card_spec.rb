require_relative '../lib/playing_card'

describe 'PlayingCard' do
  it 'should initialize with a rank and suit' do
    card = PlayingCard.new('A', 'H')

    expect(card.rank).to eq('A')
    expect(card.suit).to eq('H')
  end
end
