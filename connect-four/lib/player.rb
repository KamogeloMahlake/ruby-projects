# frozen_string_literal: true

class Player
  attr_reader :symbol

  def initialize(color)
    @color = color
    @symbol = '●'.colorize(color)
  end

  def make_move
    loop do
      print 'Enter column number: '
      choice = gets.chomp.to_i

      return choice - 1 if (0..5).include?(choice - 1)

      puts "\e[31mINCORRECT INPUT\e[0m"
    end
  end
end
