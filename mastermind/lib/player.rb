# frozen_string_literal: true

class Player
  def choosing_player
    puts 'Type y if you want to maker the code , else any key if you want to breaker code'
    choice = gets.chomp
    choice.downcase == 'y'
  end
end
