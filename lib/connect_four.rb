require_relative "game.rb"
require_relative "player.rb"
require_relative "board.rb"
=begin
def get_player_name(player_number)
  puts "Hi player #{player_number}, what is your name?"
  name = gets.chomp
end

def start_game(player_1 = "Player 1", player_2 = "player_2")
  Game.new(player_1, player_2)
end

def play
  name1 = get_player_name(1)
  name2 = get_player_name(2)
  game = start_game(name1,name2)
  game.game_loop
end

play


------ this was in my Game class (without the get_player_name method)-----
class Game
  attr_accessor :board, :player1, :player2, :move_list, :active_player
  def initialize(player_1 = 'player1', player_2 = 'player2')
    @board = Board.new
    @player1 = Player.new(player_1, "⚫")
    @player2 = Player.new(player_2, "⚪")
    @active_player = @player1
    @move_list = [0,1,2,3,4,5,6] #quarter circle forward punch

  end
 ---cut out for brevity

 see game_spec.rb for explanation.
=end

game = Game.new
game.game_loop
