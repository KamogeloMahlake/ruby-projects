class MasterMind
  attr_accessor :round, :guess, :secret_code, :code_copy
  def initialize
   @round = 12
   @guess = []
   @secret_code = []
   @code_copy = []
  end

  def playgame
    display = Display.new
    choice = Player.new.choosing_player
    if choice
      self.secret_code = HumanPlayer.new.codemaker
    else
      self.secret_code = ComputerPlayer.new.codemaker
    end
    @round.times do
      self.code_copy = self.secret_code.map(&:clone)
      self.guess = choice ? ComputerPlayer.new.codebreaker : HumanPlayer.new.codebreaker

      return "You guessed the secret code #{display.code_colors(self.secret_code)}" if self.secret_code == self.guess
      print "YOUR GUESS: #{display.code_colors(self.guess)}   "
      self.exact
      self.contains
      print "FEEDBACK: #{display.clues(self.guess)}"

    end
    "YOU LOSE: #{display.code_colors(self.secret_code)}"
  end

  def exact
    self.guess.each_with_index do |item, index|
      next if item != self.code_copy[index]
      self.guess[index] = "*"
      self.code_copy[index] = "*"
    end
  end

  def contains
    self.guess.each_with_index do |item, index|
      next unless self.guess[index] != '*' && self.code_copy.include?(item)
      self.guess[index] = "?"
      self.code_copy[self.code_copy.find_index(item)] = "?"
    end
  end
end