require "game.rb"
require "board.rb"
require "player.rb"
describe Game do
  before do
    allow_any_instance_of(IO).to receive(:puts)
    allow_any_instance_of(Object).to receive(:gets).and_return("Goku")

  end
  subject(:c4){Game.new}

  it "is a class" do
    expect(c4).to be_instance_of(Game)
  end

  it "has instance variables" do
    expect(c4).to respond_to(:board, :player1, :player2, :move_list)
  end


  describe "#get_player_name" do
    before do
      allow_any_instance_of(IO).to receive(:puts)
      allow_any_instance_of(Object).to receive(:gets).and_return("Goku")
    end

    it "receives name as input and stores it" do
      expect(c4.player1.name).to eq("Goku")
    end
  end

  describe "#switch_players" do
    it "changes the active player" do
      c4.switch_players
      expect(c4.active_player).to eq(c4.player2)
    end
  end

end

=begin
this was taken from a connect_four_spec.rb that i have deleted


require "connect_four.rb"
require "board.rb"
require "player.rb"
require "game.rb"


describe "connect_four.rb" do

  describe "#start_game" do

    it "initializes Game" do
      expect(Game).to receive(:new).with("1","2")
      start_game("1","2")
    end

    it "creates two players" do
      expect(Player).to receive(:new).with("1","⚫")
      expect(Player).to receive(:new).with("2","⚪")
      start_game("1","2")
    end

    it "uses parameters as player names" do
      expect(start_game("1","2").player1.name).to eq("1")
    end
  end

  describe "#get_player_name" do
    before do
      allow_any_instance_of(IO).to receive(:puts)
      allow_any_instance_of(Object).to receive(:gets).and_return("Goku")

    end

    it "receives name as input and stores it" do
      name = get_player_name(1)
      expect(name).to eq("Goku")
    end
  end
end


unfortunately, Although all the tests pass, this rspec file means that I have to
run the whole the game for the test to pass due to the #play call
(line 21 in the connect_four.rb).The dealing with inputs and puts statements is
still new/difficult for me. I currently dont know how to mock the whole game.

therefore, for now, i have moved the #get_player_name function within the
game class, and it is called when it Game is instantiated.
I refactored the code so that connect_four.rb does not need
testing, but this isnt good enough. I have left the previous code commented
out so that once I am really comfortable with rspec I'll come back to this
and do it how i originally intended (if i remember hopefully).
=end
