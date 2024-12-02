# frozen_string_literal: true

class LinkedList
  def initialize
    @head = nil
  end

  def append(value)
    if @head.nil?
      @head = Node.new(value)
    else
      current_node = @head
      new_node = Node.new(value)

      current_node = current_node.next_node until current_node.next_node.nil?
      current_node.next_node = new_node
      nil
    end
  end

  def prepend(value)
    if @head.nil?
      @head = Node.new(value)
    else
      current_node = @head
      @head = Node.new(value)
      @head.next_node = current_node
    end
    nil
  end

  def size
    count = 0
    current_node = @head
    until current_node.nil?
      count += 1
      current_node = current_node.next_node
    end
    count
  end

  attr_reader :head

  def tail
    current_node = @head

    current_node = current_node.next_node until current_node.next_node.nil?
    current_node
  end

  def at(index)
    current_node = @head
    current_index = 0

    until current_node.nil?
      return current_node if current_index == index

      current_node = current_node.next_node
      current_index += 1
    end
    nil
  end

  def pop
    linkedlist_size = size
    popped_node = nil
    if (linkedlist_size == 1) || linkedlist_size.zero?
      popped_node = @head if linkedlist_size == 1
      @head = nil

    elsif linkedlist_size == 2
      popped_node = @head.next_node
      @head.next_node = nil
    else
      current_node = @head
      counter = 0

      loop do
        if counter == (linkedlist_size - 2)
          popped_node = current_node.next_node
          current_node.next_node = nil
          return popped_node
        end
        current_node = current_node.next_node
        counter += 1
      end
    end
    popped_node
  end

  def contains?(value)
    current_node = @head

    until current_node.nil?
      return true if current_node.value == value

      current_node = current_node.next_node
    end
    false
  end

  def find(value)
    current_node = @head
    index = 0

    until current_node.nil?
      return index if current_node.value == value

      current_node = current_node.next_node
      index += 1
    end
    nil
  end

  def insert_at(value, index)
    return if index > size

    current_node = @head
    counter = 0
    new_node = Node.new(value)
    until current_node.nil?
      if counter == index - 1
        new_node.next_node = current_node.next_node
        current_node.next_node = new_node
        return
      end
      current_node = current_node.next_node
      counter += 1
    end
  end

  def remove_at(index)
    return if index > size - 1

    current_node = @head

    if index.zero?
      @head = current_node.next_node
    else
      counter = 0
      until current_node.nil?
        if counter == index - 1
          removed_node = current_node.next_node
          current_node.next_node = current_node.next_node.next_node
          return removed_node
        end
        current_node = current_node.next_node
        counter += 1
      end
    end
  end

  def to_s
    current_node = @head
    output = []
    until current_node.nil?
      output << if current_node.next_node.nil?
                  "( #{current_node.value} ) -> nil"
                else
                  "( #{current_node.value}) -> "
                end
      current_node = current_node.next_node
    end
    output.join('')
  end
end
