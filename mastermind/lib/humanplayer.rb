class HumanPlayer
  def enter_code
    loop do
      print "\nENTER CODE: "
      guess = gets.chomp.split("")

      return guess if guess.all? { |item| (1..6).include?(item.to_i)} && guess.length == 4
      puts "INVALID CODE"
    end
  end
end
