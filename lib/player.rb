class Player

  attr_accessor :name, :type

  def initialize(name, type)
    @name = name
    @type = type
  end

  def get_player_move(move_list)
    player_move_message
    choice = gets.chomp.to_i
    until move_list.include?(choice)
      column_error_message
      choice = gets.chomp.to_i
    end
    choice
  end

  def player_move_message
    puts "\n#{@name}, which column you would like to play your piece"
  end

  def column_error_message
    puts "\n#{@name}, Please choose a valid column from 0-6. Try again: "
  end
end
