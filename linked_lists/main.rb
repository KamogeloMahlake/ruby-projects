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