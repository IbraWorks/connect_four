require "board.rb"


describe Board do
  let(:c4){Board.new}

  it "is a class" do
    expect(c4).to be_instance_of Board
  end

  it "has instance variables" do
    expect(c4).to respond_to(:game_board, :turns)
  end

  it "is initialized with a game_board array of size 7x6" do
    board = Array.new(7) { Array.new(6, " ") }
    expect(c4.game_board).to eq(board)
  end

  describe "turns" do
    it "starts at 1" do
      expect(c4.turns).to eq(1)
    end
  end

  describe "#draw_board" do
    it "draws the game_board" do
      expect($stdout).to receive(:puts).with("+---+---+---+---+---+---+---+
|   |   |   |   |   |   |   |
+---+---+---+---+---+---+---+
|   |   |   |   |   |   |   |
+---+---+---+---+---+---+---+
|   |   |   |   |   |   |   |
+---+---+---+---+---+---+---+
|   |   |   |   |   |   |   |
+---+---+---+---+---+---+---+
|   |   |   |   |   |   |   |
+---+---+---+---+---+---+---+
|   |   |   |   |   |   |   |
+---+---+---+---+---+---+---+
  0   1   2   3   4   5   6 ")

      c4.draw_board
    end

    it "handles updated board" do
      expect($stdout).to receive(:puts).with("+---+---+---+---+---+---+---+
|   |   |   |   |   |   |   |
+---+---+---+---+---+---+---+
|   |   |   |   |   |   |   |
+---+---+---+---+---+---+---+
|   |   |   |   |   |   |   |
+---+---+---+---+---+---+---+
|   |   |   |   |   |   |   |
+---+---+---+---+---+---+---+
|   |   |   |   |   |   |   |
+---+---+---+---+---+---+---+
| 1 |   |   |   |   |   |   |
+---+---+---+---+---+---+---+
  0   1   2   3   4   5   6 ")

      c4.game_board[0][0] = 1
      c4.draw_board
    end
  end

  describe "#victory?" do
    it "triggers if horizontal_vic? is true" do
      c4.game_board[3][5] = 1
      c4.game_board[4][5] = 1
      c4.game_board[5][5] = 1
      c4.game_board[6][5] = 1
      expect(c4.victory?).to be(true)
    end

    describe "#horizontal_vic?" do
      it "triggers if horizontal win condition is met" do
        c4.game_board[3][5] = 1
        c4.game_board[4][5] = 1
        c4.game_board[5][5] = 1
        c4.game_board[6][5] = 1
        expect(c4.horizontal_vic?).to be(true)
      end
    end

    describe "#vertical_vic?" do
      it "triggers if vertical win condition is met" do
        c4.game_board[2][2] = 1
        c4.game_board[2][3] = 1
        c4.game_board[2][4] = 1
        c4.game_board[2][5] = 1
        expect(c4.vertical_vic?).to be(true)
      end
    end

    describe "#diagonal_vic?" do
      it "triggers if diagonal win condition is met" do
        c4.game_board[3][3] = 1
        c4.game_board[2][2] = 1
        c4.game_board[1][1] = 1
        c4.game_board[0][0] = 1
        expect(c4.diagonal_vic?).to be(true)
      end
    end

  end




end
