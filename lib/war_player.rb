class WarPlayer
  attr_accessor :name, :player_stack

  def initialize(name)
    @name = name
    @player_stack = []
  end

  def play_card
    player_stack.pop
  end
end
