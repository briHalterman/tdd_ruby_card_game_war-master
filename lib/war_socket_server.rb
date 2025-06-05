require 'socket'
require_relative 'war_game'
require_relative 'war_player'

class WarSocketServer
  def initialize
  end

  def port_number
    3336
  end

  def games
    @games ||= []
  end

  def players
    @players ||= []
  end

  def clients
    @clients ||= []
  end

  def start
    @server = TCPServer.new(port_number)
  end

  def accept_new_client(player_name = "Random Player")
    client = @server.accept_nonblock
    clients.push client
    player = WarPlayer.new(player_name)
    players.push player
    client.puts "Welcome to the game of War!"
    # associate player and client
  rescue IO::WaitReadable, Errno::EINTR
    puts "No client to accept"
  end

  def create_game_if_possible
    if players.count == 2
      game = WarGame.new
      
      games << game
      game.start
      clients.each { |client|  client.puts('War game is starting! Let\'s go!')}
    end
  end

  def stop
    @server.close if @server
  end
end