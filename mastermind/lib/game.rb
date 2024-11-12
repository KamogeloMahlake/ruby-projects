class MasterMind
  attr_accessor :round, :guess, :secret_code, :feedback
  def initialize
   @round = 12
   @guess = []
   @secret_code = []
   @feedback ={red: 0, white: 0}
  end

  def playgame
    self.secret_code = ComputerPlayer.new.codemaker
    @round.times do
      self.guess = HumanPlayer.new.codebreaker

      return "You guessed the secret code #{self.secret_code}" if self.secret_code == self.guess

      self.feedback[:red] = self.exact
      self.feedback[:white] = self.contains
      p self.feedback
    end
    "YOU LOSE: #{self.secret_code}"
  end

  def exact
    same = 0
    self.guess.each_with_index do |item, index|
      next if item != self.secret_code[index]
      same += 1
      self.guess[index] = "*"
    end
    same
  end

  def contains
    contain = 0

    self.guess.each_with_index do |item, index|
      next if !self.secret_code.include?(item)

      contain += 1
      self.guess[index] = "?"
    end
    contain
  end
end




