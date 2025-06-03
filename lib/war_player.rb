class WarPlayer
  attr_accessor :player_name, :player_stack

  def initialize(player_name)
    @player_name = player_name
    @player_stack = []
  end
end
