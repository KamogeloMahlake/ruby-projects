# frozen_string_literal: true

class Board
  attr_accessor :positions

  def initialize
    @positions = Array.new(6) { Array.new(6, 'o') }
  end

  def to_s
    output = "+---+---+---+---+---+---+\n"
    @positions.each do |row|
      row.each do |x|
        output += "| #{x} "
      end
      output += "|\n+---+---+---+---+---+---+\n"
    end
    output += "  1   2   3   4   5   6  \n"
    output
  end
end
