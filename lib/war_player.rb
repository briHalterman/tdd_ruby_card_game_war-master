require_relative 'war_game'
class WarPlayer
  attr_accessor :name, :player_stack, :middle_stack

  def initialize(name)
    @name = name
    @player_stack = []
  end

  def play_card
    player_stack.pop
  end

  def take_stack(middle_stack)
    player_stack.unshift(*middle_stack)
    middle_stack.clear
  end
end
