# frozen_string_literal: true

require_relative 'game'
class Player
  attr_accessor :letter

  def initialize(letter)
    @letter = letter
  end
end

class HumanPlayer < Player
  def get_move(array)
    loop do
      print 'Enter: '
      choice = gets.chomp.to_i

      if array.include?(choice)
        return choice
      elsif choice.is_a?(String)
        puts 'Enter a number'
      else
        puts "Invalid square. Try choosing among the following: #{array}"
      end
    end
  end
end

class ComputerPlayer < Player
  def get_move(array)
    array.sample
  end
end
