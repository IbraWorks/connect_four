require "player.rb"


describe Player do
  let(:player){Player.new("Goku", "⚫")}

  it "is a class" do
    expect(player).to be_instance_of(Player)
  end

  it "has instance variables" do
    expect(player).to respond_to(:name, :type)
  end
end
