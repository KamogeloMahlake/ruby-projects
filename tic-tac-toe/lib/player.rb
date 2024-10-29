require_relative 'game'
class Player
  attr_accessor :letter
  def initialize(letter)
    @letter = letter
  end

end

class HumanPlayer < Player
  def initialize(letter)
    super(letter)
  end
  
  def get_move(array)
    i = 0
    while i < 1 do
      print "Enter: "
      choice = gets.chomp.to_i

      if array.include?(choice)
        i += 1
      elsif choice.is_a?(String)
        puts "Enter a number"
      else
        puts "Invalid square. Try choosing among the following: #{array}"
      end
    end
    return choice
  end
end

class ComputerPlayer < Player
  def initialize(letter)
    super(letter)
  end

  def get_move(array)
    return array.sample
  end
end



