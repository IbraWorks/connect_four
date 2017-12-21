
class Game
  attr_accessor :board, :player1, :player2, :move_list, :active_player
  def initialize
    @board = Board.new
    @player1 = Player.new(get_player_name(1), "⚫")
    @player2 = Player.new(get_player_name(2), "⚪")
    @active_player = @player1
    @move_list = [0,1,2,3,4,5,6] #quarter circle forward punch

  end

  def get_player_name(player_number)
    puts "Hi player #{player_number}, what is your name?"
    name = gets.chomp
  end

  def game_loop
    title
    intro
    loop do
      @board.draw_board
      add_turn(@active_player.get_player_move(@move_list), @active_player.type)
      @board.draw_board
      if is_game_over?
        break
      end
      switch_players
    end

  end

  #start at zeroth row, and if the player move on that row != " " raise the
  #row level by one.
  def add_turn(player_move, player_type)
    @@count = 0
    until @board.game_board[player_move][@@count] == " "
      @@count += 1
    end
    @board.game_board[player_move][@@count] = player_type
    @move_list.delete(player_move) if @@count == 5
  end

  def switch_players
    @active_player == @player1 ? @active_player = @player2 : @active_player = @player1
  end


  def is_game_over?
    return true if check_win? || check_draw?
  end

  def check_win?
    if @board.victory?
      puts "\nCongrats #{@active_player.name}, You Win!\n"
      return true
    end
  end

  def check_draw?
    if (check_win? == false) && @move_list.length == 0
      puts "\nA very competitive game, it ends as a draw!\n"
      return true
    end
  end

  def title
    puts "\n\n   ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄        ▄  ▄▄        ▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄       ▄         ▄
▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░▌      ▐░▌▐░░▌      ▐░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌     ▐░▌       ▐░▌
▐░█▀▀▀▀▀▀▀▀▀ ▐░█▀▀▀▀▀▀▀█░▌▐░▌░▌     ▐░▌▐░▌░▌     ▐░▌▐░█▀▀▀▀▀▀▀▀▀ ▐░█▀▀▀▀▀▀▀▀▀  ▀▀▀▀█░█▀▀▀▀      ▐░▌       ▐░▌
▐░▌          ▐░▌       ▐░▌▐░▌▐░▌    ▐░▌▐░▌▐░▌    ▐░▌▐░▌          ▐░▌               ▐░▌          ▐░▌       ▐░▌
▐░▌          ▐░▌       ▐░▌▐░▌ ▐░▌   ▐░▌▐░▌ ▐░▌   ▐░▌▐░█▄▄▄▄▄▄▄▄▄ ▐░▌               ▐░▌          ▐░█▄▄▄▄▄▄▄█░▌
▐░▌          ▐░▌       ▐░▌▐░▌  ▐░▌  ▐░▌▐░▌  ▐░▌  ▐░▌▐░░░░░░░░░░░▌▐░▌               ▐░▌          ▐░░░░░░░░░░░▌
▐░▌          ▐░▌       ▐░▌▐░▌   ▐░▌ ▐░▌▐░▌   ▐░▌ ▐░▌▐░█▀▀▀▀▀▀▀▀▀ ▐░▌               ▐░▌           ▀▀▀▀▀▀▀▀▀█░▌
▐░▌          ▐░▌       ▐░▌▐░▌    ▐░▌▐░▌▐░▌    ▐░▌▐░▌▐░▌          ▐░▌               ▐░▌                    ▐░▌
▐░█▄▄▄▄▄▄▄▄▄ ▐░█▄▄▄▄▄▄▄█░▌▐░▌     ▐░▐░▌▐░▌     ▐░▐░▌▐░█▄▄▄▄▄▄▄▄▄ ▐░█▄▄▄▄▄▄▄▄▄      ▐░▌                    ▐░▌
▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░▌      ▐░░▌▐░▌      ▐░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌     ▐░▌                    ▐░▌
 ▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀        ▀▀  ▀        ▀▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀▀▀       ▀                      ▀ \n\n\n"
  end

  def intro
    puts "Rules of the game are simple. Choose which column to place your piece in"
    puts "The player who is first to get four connecting pieces wins"
    puts "pieces can connect diagonally, vertically or horizontally"
    puts "Play on\n\n"
  end


end
