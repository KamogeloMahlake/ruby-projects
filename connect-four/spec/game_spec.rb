# frozen_string_literal: true

require_relative '../lib/game'
require_relative '../lib/player'
require_relative '../lib/board'
require 'colorize'

describe Game do
  describe '#valid?' do
    it 'return true if number in range' do
      game = Game.new
      expect(game.valid?(7)).to eql(false)
      expect(game.valid?(1)).to eql(true)
      expect(game.valid?(6)).to eql(false)
    end
  end

  describe '#check_winner?' do
    it 'return true if the are four in a row' do
      game = Game.new
      game.board.positions[0][0] = game.player1.symbol
      game.board.positions[0][1] = game.player1.symbol
      game.board.positions[0][2] = game.player1.symbol
      game.board.positions[0][3] = game.player1.symbol
      expect(game.check_winner?(game.player1.symbol)).to eql(true)
    end

    it 'return true if the are four in a column' do
      game = Game.new
      game.board.positions[0][0] = game.player1.symbol
      game.board.positions[1][0] = game.player1.symbol
      game.board.positions[2][0] = game.player1.symbol
      game.board.positions[3][0] = game.player1.symbol
      expect(game.check_winner?(game.player1.symbol)).to eql(true)
    end

    it 'return true if row is equal start' do
      game = Game.new
      game.board.positions[2][0] = game.player1.symbol
      game.board.positions[3][1] = game.player1.symbol
      game.board.positions[4][2] = game.player1.symbol
      game.board.positions[5][3] = game.player1.symbol
      expect(game.check_winner?(game.player1.symbol)).to eql(true)
    end

    it 'return true if row is equal column' do
      game = Game.new
      game.board.positions[0][0] = game.player1.symbol
      game.board.positions[1][1] = game.player1.symbol
      game.board.positions[2][2] = game.player1.symbol
      game.board.positions[3][3] = game.player1.symbol
      expect(game.check_winner?(game.player1.symbol)).to eql(true)
    end

    it 'return true if column equal start' do
      game = Game.new
      game.board.positions[-2][-2] = game.player1.symbol
      game.board.positions[-3][-3] = game.player1.symbol
      game.board.positions[-4][-4] = game.player1.symbol
      game.board.positions[-5][-5] = game.player1.symbol
      expect(game.check_winner?(game.player1.symbol)).to eql(true)
    end
  end
end
