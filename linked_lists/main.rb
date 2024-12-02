# frozen_string_literal: true

require_relative 'lib/linkedlist'
require_relative 'lib/node'

list = LinkedList.new

list.append('dog')
list.prepend('cat')
list.prepend('parrot')
list.append('hamster')
list.append('snake')
list.append('turtle')
puts list
puts list.size
puts list.head
puts list.tail
puts list.at(2).value
puts list.contains?('parrot')
puts list.find('turtle')
list.insert_at(1, 6)
puts list.remove_at(5)
puts list.pop
puts list
