# frozen_string_literal: true

require_relative 'lib/node'
require_relative 'lib/tree'

array = Array.new(15) { rand(1..100) }

tree = Tree.new(array)
puts tree.balanced?
puts "Level order: #{tree.level_order}"
puts "Inorder: #{tree.inorder}"
puts "Pre order: #{tree.preorder}"
puts "Post order: #{tree.postorder}"

10.times do
  tree.insert(rand(1..100))
end
puts tree.balanced?
tree.rebalanced!
puts tree.balanced?
puts "Level order: #{tree.level_order}"
puts "Inorder: #{tree.inorder}"
puts "Pre order: #{tree.preorder}"
puts "Post order: #{tree.postorder}"
