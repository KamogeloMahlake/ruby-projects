require_relative "lib/game"
require_relative "lib/player"



def get_human_player_letter
  i = 0
  letters = ["X", "O"]
  while i < 1 do
    print "X or O: "
    letter = gets.chomp.upcase

    if letters.include?(letter)
      i += 1
    end
  end
  
  return letter
end
human_letter = get_human_player_letter
computer_letter = human_letter == "X" ? "O" : "X"

def play_game(human_letter, computer_letter)
  game = Game.new
  human = HumanPlayer.new(human_letter)
  computer = ComputerPlayer.new(computer_letter)

  puts game
  while (game.current_winner == false) do
    begin
      if human_letter == "X"
        player_move = human.get_move(game.get_available_moves)
        game.make_move(player_move, human_letter)
        puts "#{human_letter} makes a move to square #{player_move}"
      
        sleep 0.8

        computer_move = computer.get_move(game.get_available_moves)
        game.make_move(computer_move, computer_letter)
        puts "#{computer_letter} makes a move to square #{computer_move}"

      else
        computer_move = computer.get_move(game.get_available_moves)
        game.make_move(computer_move, computer_letter)
        puts "#{computer_letter} makes a move to square #{computer_move}"
        puts game
        sleep 0.8
        player_move = human.get_move(game.get_available_moves)
        game.make_move(player_move, human_letter)
        puts "#{human_letter} makes a move to square #{player_move}"
      end
      
      puts game
    rescue StandardError
      break
    end
  end
  if game.current_winner == false
    return "no available moves\nIt's a tie!"
  end
  return " #{game.current_winner} is the winner"
end

puts play_game(human_letter,computer_letter)




