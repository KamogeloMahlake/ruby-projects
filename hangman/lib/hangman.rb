# frozen_string_literal: true

require 'json'

class Hangman
  attr_accessor :current_turns, :word, :feedback, :word_array, :incorrect_letters

  def initialize
    @words = ReadFile.new('google-10000-english-no-swears.txt').select_words
    @word = @words.sample
    @feedback = Array.new(@word.length) { |_i| '_' }
    @word_array = @word.downcase.split('')
    @incorrect_letters = []
    @current_turns = @word.length
  end

  def is_integer?
    to_i.to_s == self
  end

  def play_game
    puts '***********HANGMAN*************'
    print "\nIF YOU WANT TO CONTINUE A PREVIOUSLY SAVED GAME, PRESS (L)\nFOR NEW GAME PRESS ANY KEY: "
    choice = gets.chomp.upcase

    if choice.downcase == 'l'
      print "\nEnter filename(with file extenstion): "
      filename = gets.chomp
      file = LoadSave.new("./save/#{filename}")
      if file.file_exists
        file = file.save_data
        self.current_turns = file[:turns]
        self.feedback = file[:feedback]
        self.word_array = file[:word_array]
        self.incorrect_letters = file[:incorrect_letters]
        self.word = file[:word]
        File.delete("./save/#{filename}")
      else
        puts "\nFile does not exit! NEW GAME WILL START"
      end
    end
    puts "\nIF YOU WANT TO SAVE CURRENT GAME, ENTER A YES"
    loop do
      print "\nENTER GUESS: "
      guess = gets.chomp.downcase

      if guess.upcase == 'YES'
        save_game(current_turns, word, feedback, word_array, incorrect_letters)
        return
      end

      while word_array.include?(guess[0])
        feedback[word_array.find_index(guess[0])] = guess[0]
        word_array[word_array.find_index(guess[0])] = '_'
      end
      incorrect_letters.push(guess[0]) if !feedback.include?(guess[0]) && !incorrect_letters.include?(guess[0])

      return "Guessed the correct word:  #{word}" if word.downcase == feedback.join('')

      self.current_turns -= 1
      puts "\nCORRECT LETTERS: #{feedback.join(' ')}      INCORRECT LETTERS: #{incorrect_letters.join}  CHANCES REMAINING: #{self.current_turns}"
      break if self.current_turns.zero?
    end
    puts "\nSECRET WORD: #{word}"
  end

  private

  def save_game(turns, secret_word, current_feedback, word_array, incorrect_letters)
    Dir.mkdir('save') unless Dir.exist?('save')
    print 'Enter name of save file: '
    filename = gets.chomp
    data = { turns: turns, word: secret_word, feedback: current_feedback, word_array: word_array,
             incorrect_letters: incorrect_letters }.to_json
    File.open("save/#{filename}.txt", 'w') do |file|
      file.puts data
    end
  end
end
