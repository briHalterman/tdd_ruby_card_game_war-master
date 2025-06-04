require_relative '../lib/playing_card'

describe 'PlayingCard' do
  describe 'initialize' do
    it 'should initialize with a rank and suit' do
      card = PlayingCard.new('A', 'H')

      expect(card.rank).to eq('A')
      expect(card.suit).to eq('H')
    end

    it 'should be a valid suit' do
      expect{
        PlayingCard.new('A', 'X')
      }.to raise_error StandardError
    end

    it 'should be a valid rank' do
      expect{
        PlayingCard.new('X', 'H')
      }.to raise_error StandardError
    end

    it 'should assign the correct value to a card\'s suit' do
      card = PlayingCard.new('A', 'H')

      expect(card.value).to eq 12
    end
  end
end
