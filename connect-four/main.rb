# frozen_string_literal: true

require_relative 'lib/board'
require_relative 'lib/game'
require_relative 'lib/player'

require 'colorize'

x = Game.new.playgame
puts x
