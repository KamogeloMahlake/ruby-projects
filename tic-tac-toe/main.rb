# frozen_string_literal: true

require_relative 'lib/game'
require_relative 'lib/player'

def human_player_letter
  letters = %w[X O]
  loop do
    print 'X or O: '
    letter = gets.chomp.upcase

    return letter if letters.include?(letter)
  end
end
human_letter = human_player_letter
computer_letter = human_letter == 'X' ? 'O' : 'X'

def play_game(human_letter, computer_letter)
  game = Game.new
  human = HumanPlayer.new(human_letter)
  computer = ComputerPlayer.new(computer_letter)
  puts game
  letter = 'X'
  while game.available_moves
    if human_letter == letter
      player_move = human.get_move(game.available_moves)
      game.make_move(player_move, human_letter)
      puts "#{letter} make move to square #{player_move}"
    else
      computer_move = computer.get_move(game.available_moves)
      game.make_move(computer_move, computer_letter)
      puts "#{letter} make move to square #{computer_move}"
    end
    puts game
    return " #{game.current_winner} is the winner" if game.winner(letter)

    letter = letter == 'X' ? 'O' : 'X'
    sleep 0.8
  end
  "no available moves\nIt's a tie!"
end

puts play_game(human_letter, computer_letter)
