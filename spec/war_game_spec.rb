require_relative '../lib/war_game'

describe 'WarGame' do
  it 'initializes a game with two players' do
    game = WarGame.new

    expect(game.player1).to be_a WarPlayer
    expect(game.player2).to be_a WarPlayer
  end
end
