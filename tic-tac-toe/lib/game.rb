# frozen_string_literal: true

class Game
  attr_accessor :squares, :current_winner

  def initialize
    @squares = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @current_winner = false
  end

  def to_s
    x = 0
    board = "---+---+---\n"
    (0..2).each do |_|
      row = ''
      (0..2).each do |j|
        row += j == 2 ? " #{@squares[x]}" : " #{@squares[x]} |"
        x += 1
      end
      board += "#{row}\n---+---+---\n"
    end
    board
  end

  def make_move(square, letter)
    if @squares[square - 1].is_a?(Integer)
      squares[square - 1] = letter

      self.current_winner = letter if winner(letter)
      return true
    end
    false
  end

  def winner(letter)
    winning_lines = [
      @squares.first(3).all? { |square| square == letter },
      @squares.last(3).all? { |square| square == letter },
      @squares[3..5].all? { |square| square == letter },
      @squares.values_at(0, 3, 6).all? { |square| square == letter },
      @squares.values_at(1, 4, 7).all? { |square| square == letter },
      @squares.values_at(2, 5, 8).all? { |square| square == letter },
      @squares.values_at(0, 4, 8).all? { |square| square == letter },
      @squares.values_at(2, 4, 6).all? { |square| square == letter }
    ]
    winning_lines.any? { |i| i == true }
  end

  def available_moves
    squares.select { |i| i if i.is_a?(Integer) }
  end
end
