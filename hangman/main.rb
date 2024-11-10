# frozen_string_literal: true

require_relative 'lib/hangman'
require_relative 'lib/read_file'
require_relative 'lib/load_save'
require 'json'
puts Hangman.new.play_game
