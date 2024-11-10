class MasterMind
  @@colors = ["Red", "Blue", "Green", "Yellow", "Pink", "Purple"]
  
  def play_game(secret_code, guess)
    rounds = 1
    while rounds > 0 do  
      guess_array = guess

      if secret_code == guess_array
        return "You guessed the correct code"
      end
      feedback = []
      index = []
      secret_code.each_with_index do |i, i_index|
        guess_array.each_with_index do |j, j_index|
          if i_index == j_index && i == j
            feedback.push("red")
            index.push(j_index)
          
          elsif !index.include?(j_index) && secret_code.include?(j)
            feedback.push("white")
            index.push(j_index)
          end
        end
      end

      rounds -= 1
      puts feedback.join(", ")
      p index
    end
  end
end


game = MasterMind.new

puts game.play_game(["red", "blue", "black", "green"], ["red", "green", "black", "blue"])
