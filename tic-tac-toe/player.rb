require_relative 'game'
class Player
  def initialize(letter)
    @letter = letter
  end

end

class HumanPlayer < Player
  def initialize(letter)
    super(letter)
  end

end

class ComputerPlayer
  def initialize(letter)
    @letter = letter
  end

  def get_move(array)
    return array.shuffle.first
  end
end


t = Game.new
c = ComputerPlayer.new("O")
puts t.make_move(c.get_move(t.get_available_moves), "O")
puts t.make_move(c.get_move(t.get_available_moves), "O")
puts t.make_move(c.get_move(t.get_available_moves), "O")
puts t.make_move(c.get_move(t.get_available_moves), "O")
puts t.make_board
