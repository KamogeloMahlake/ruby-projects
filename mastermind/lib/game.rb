# frozen_string_literal: true

class MasterMind
  attr_accessor :round, :guess, :secret_code, :code_copy, :clone_computer_code, :feedback, :player_guess_copy

  def initialize
    @round = 12
    @guess = []
    @secret_code = []
    @code_copy = []
    @clone_computer_code = []
    @feedback = { red: 0, white: 0 }
    @player_guess_copy = []
    @human_player = HumanPlayer.new
    @computer_player = ComputerPlayer.new
  end

  def human_solver
    @human_player.enter_code
  end

  def playgame
    display = Display.new
    choice = Player.new.choosing_player
    self.secret_code = if choice
                         human_solver
                       else
                         @computer_player.codemaker
                       end

    @round.times do
      count = feedback.values.inject { |red, white| red + white }
      self.code_copy = secret_code.map(&:clone)
      self.guess = choice ? @computer_player.codebreaker(clone_computer_code, count) : human_solver
      return "\nYou guessed the secret code #{display.code_colors(secret_code)}" if secret_code == guess

      self.clone_computer_code = choice ? guess.map(&:clone) : []
      self.player_guess_copy = !choice ? guess.map(&:clone) : false

      self.feedback = { red: exact, white: contains }
      print "\nYOUR GUESS: #{display.code_colors(player_guess_copy || clone_computer_code)}   "

      print "\nFEEDBACK: #{display.clues(guess)}"
      sleep 1
    end
    "\nYOU LOSE, SECRET CODE: #{display.code_colors(secret_code)}"
  end

  def exact
    same = 0
    guess.each_with_index do |item, index|
      next if item != code_copy[index]

      guess[index] = '*'
      code_copy[index] = '*'
      same += 1
    end
    same
  end

  def contains
    contain = 0
    guess.each_with_index do |item, index|
      next unless guess[index] != '*' && code_copy.include?(item)

      guess[index] = '?'
      code_copy[code_copy.find_index(item)] = '?'
      contain += 1
    end
    contain
  end
end
