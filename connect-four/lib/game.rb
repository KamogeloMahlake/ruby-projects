# frozen_string_literal: true

class Game
  attr_accessor :board, :player1, :player2

  def initialize
    @board = Board.new
    @player1 = Player.new(:red)
    @player2 = Player.new(:blue)
  end

  def playgame
    currentplayer = 0
    symbol = ''
    while @board.positions[0].include?('o')
      puts @board
      choice = currentplayer.even? ? @player1.make_move : @player2.make_move
      if valid?(choice)
        symbol = currentplayer.even? ? @player1.symbol : @player2.symbol
        @board.positions[@current_column][choice] = symbol
        currentplayer += 1
      end

      return "#{@board}\n#{symbol} is the winner" if check_winner?(symbol)
    end
    puts 'NO AVAILABLE SPOTS'
  end

  def valid?(choice)
    i = 5
    loop do
      if @board.positions[i][choice] == 'o'
        @current_column = i
        return true
      end
      i -= 1
      break if i.negative?
    end
    false
  end

  def check_winner?(color)
    @board.positions.each do |row|
      color_count = 0
      row.each do |item|
        color_count = item == color ? color_count + 1 : 0
        return true if color_count == 4
      end
    end

    (0..5).each do |i|
      color_count = 0
      (0..5).each do |j|
        color_count = @board.positions[j][i] == color ? color_count + 1 : 0
        return true if color_count == 4
      end
    end

    start = 0
    loop do
      color_count = 0
      column = start
      row = 0
      (0..5).each do |_i|
        color_count = @board.positions[row][column] == color ? color_count + 1 : 0
        return true if color_count == 4

        row += 1
        column += 1
        break if column > 5 || row > 5
      end

      start += 1
      break if start > 5
    end

    start = 0
    loop do
      color_count = 0
      row = start
      column = 0
      (0..5).each do |_i|
        color_count = @board.positions[row][column] == color ? color_count + 1 : 0
        return true if color_count == 4

        row += 1
        column += 1
        break if column > 5 || row > 5
      end

      start += 1
      break if start > 5
    end

    start = 0
    loop do
      color_count = 0
      row = start
      column = -1
      (0..5).each do |_i|
        color_count = @board.positions[row][column] == color ? color_count + 1 : 0
        return true if color_count == 4

        row += 1
        column -= 1
        break if column < -6 || row > 5
      end

      start += 1
      break if start > 5
    end

    start = 0
    loop do
      color_count = 0
      column = start
      row = -1
      (0..5).each do |_i|
        color_count = @board.positions[row][column] == color ? color_count + 1 : 0
        return true if color_count == 4

        row += 1
        column -= 1
        break if column < -6 || row > 5
      end

      start += 1
      break if start > 5
    end

    false
  end
end
