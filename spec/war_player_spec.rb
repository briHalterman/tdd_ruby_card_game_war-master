require_relative '../lib/war_player'

describe 'WarPlayer' do
  it 'initializes with a name' do
    player = WarPlayer.new('PlayerX')

    puts @player
    expect(player.player_name).to eq 'PlayerX'
  end

  it 'initializes with an empty stack' do
    player = WarPlayer.new('PlayerX')

    expect(player.player_stack).to be_empty
  end
end
