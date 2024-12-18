# frozen_string_literal: true

class Node
  attr_accessor :value, :previous

  def initialize(value)
    @previous = nil
    @value = value
  end
end

def all_possible_moves(edge)
  moves = [[2, 1], [2, -1], [-2, 1], [-2, -1], [1, 2], [-1, 2], [1, -2], [-1, -2]]

  moves.map { |x, y| [x + edge[0], y + edge[1]] }.filter { |i, j| (0..7).include?(i) && (0..7).include?(j) }
end

def final_node(start, finish)
  queue = [Node.new(start)]
  loop do
    return queue[0] if queue[0].value == finish

    all_possible_moves(queue[0].value).each do |move|
      move = Node.new(move)
      move.previous = queue[0]
      queue << move
    end
    queue.delete_at 0
  end
end

def knight_moves(start, finish)
  node = final_node(start, finish)
  array = []
  until node.nil?
    array.unshift(node.value)
    node = node.previous
  end

  str = "You make it in #{array.length - 1} moves! Here's your path:\n"

  array.each { |move| str += "#{move}\n" }
  str
end

puts knight_moves([4, 3], [3, 3])
