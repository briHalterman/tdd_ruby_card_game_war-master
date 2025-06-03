require_relative '../lib/war_game'

describe 'WarGame' do
  it 'initializes a game with a deck' do
    game = WarGame.new

    expect(game.deck).to respond_to :cards
  end

  it 'initializes a game with two players' do
    game = WarGame.new

    expect(game.player1).to be_a WarPlayer
    expect(game.player2).to be_a WarPlayer
  end

  it 'deals a card to a player' do
    game = WarGame.new
    game.deal_card(game.player1)

    puts game.player1
    expect(game.player1.player_stack.count).to eq 1
  end
end
