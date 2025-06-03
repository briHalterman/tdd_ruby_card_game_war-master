require_relative '../lib/war_player'

describe 'WarPlayer' do
  it 'initializes with a name' do
    player = WarPlayer.new('PlayerX')

    puts @player
    expect(player.player_name).to eq 'PlayerX'
  end
end
