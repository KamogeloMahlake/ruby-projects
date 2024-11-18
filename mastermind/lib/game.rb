class MasterMind
  attr_accessor :round, :guess, :secret_code, :code_copy, :clone_computer_code, :feedback, :player_guess_copy
  def initialize
   @round = 12
   @guess = []
   @secret_code = []
   @code_copy = []
   @clone_computer_code = []
   @feedback = {red: 0, white: 0}
   @player_guess_copy = []
   @human_player  = HumanPlayer.new
   @computer_player = ComputerPlayer.new
  end
  
  def human_solver
    @human_player.enter_code
  end
  
  def playgame
    display = Display.new
    choice = Player.new.choosing_player
    if choice
      self.secret_code = self.human_solver
    else
      self.secret_code = @computer_player.codemaker
    end
    
    @round.times do
      count = feedback.values.inject {|red, white| red + white}
      self.code_copy = self.secret_code.map(&:clone)
      self.guess = choice ? @computer_player.codebreaker(self.clone_computer_code, count) : self.human_solver
      return "\nYou guessed the secret code #{display.code_colors(self.secret_code)}" if self.secret_code == self.guess
      self.clone_computer_code = choice ? self.guess.map(&:clone) : []
      self.player_guess_copy = !choice ? self.guess.map(&:clone) : false

      self.feedback = {red: self.exact, white: self.contains}
      print "\nYOUR GUESS: #{display.code_colors(self.player_guess_copy || self.clone_computer_code)}   "

      
      print "\nFEEDBACK: #{display.clues(self.guess)}"
      sleep 1

    end
    "\nYOU LOSE, SECRET CODE: #{display.code_colors(self.secret_code)}"
  end

  def exact
    same = 0
    self.guess.each_with_index do |item, index|
      next if item != self.code_copy[index]
      self.guess[index] = "*"
      self.code_copy[index] = "*"
      same += 1
    end
    same
  end

  def contains
    contain = 0
    self.guess.each_with_index do |item, index|
      next unless self.guess[index] != '*' && self.code_copy.include?(item)
      self.guess[index] = "?"
      self.code_copy[self.code_copy.find_index(item)] = "?"
      contain += 1
    end
    contain
  end
end