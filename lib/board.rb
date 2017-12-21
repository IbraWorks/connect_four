
class Board
  attr_accessor :game_board, :turns

  def initialize
    @game_board = Array.new(7) { Array.new(6, " ") }
    @turns = 1
  end

  def draw_board
    board = ""
    #5.downto(0) for the rows so that the first entry, [0,0] is on the bottom
    #of the board, mimicking an actual game of connect four
    5.downto(0) do|row|
      board << "+---+---+---+---+---+---+---+\n"
      0.upto(6) do|col|
        board << "| #{@game_board[col][row]} "
      end
      board << "|\n"
    end

    board << "+---+---+---+---+---+---+---+\n"
    board << "  0   1   2   3   4   5   6 "
    puts board
  end

  def victory?
    return true if horizontal_vic? || vertical_vic? || diagonal_vic?
  end

  #goes through game_board, drawing all possible win conditions
  def horizontal_vic?
    0.upto(5) do |y|
      0.upto(3) do |x|
        return true if @game_board[x][y] != " " && @game_board[x][y] == @game_board[x+1][y] && @game_board[x][y] == @game_board[x+2][y] && @game_board[x+2][y] == @game_board[x+3][y]
      end
    end
    return false
  end

  def vertical_vic?
    0.upto(6) do |x|
      0.upto(2) do |y|
        return true if @game_board[x][y] != " " && @game_board[x][y] == @game_board[x][y+1] && @game_board[x][y+1] == @game_board[x][y+2] && @game_board[x][y+2] == @game_board[x][y+3]
      end
    end
    return false
  end

  def diagonal_vic?
    0.upto(3) do |x|
      0.upto(2) do |y|
        return true if @game_board[x][y] != ' ' && @game_board[x][y] == @game_board[x + 1][y + 1] && @game_board[x + 1][y + 1] == @game_board[x + 2][y + 2] && @game_board[x + 2][y + 2] == @game_board[x + 3][y + 3]
      end

      3.upto(5) do |y|
        return true if @game_board[x][y] != ' ' && @game_board[x][y] == @game_board[x + 1][y - 1] && @game_board[x + 1][y - 1] == @game_board[x + 2][y - 2] && @game_board[x + 2][y - 2] == @game_board[x + 3][y - 3]
      end
    end
    false
  end

end
