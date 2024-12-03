# frozen_string_literal: true

class Node
  attr_accessor :value, :next_node, :key

  def initialize(key = nil, value = nil, next_node = nil)
    @key = key
    @value = value
    @next_node = next_node
  end
end
