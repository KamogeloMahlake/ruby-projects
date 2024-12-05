# frozen_string_literal: true

class Tree
  attr_reader :arr

  def initialize(arr)
    @arr = arr.uniq.sort
    @root = build_tree(@arr)
  end

  def height(node = @root, count = -1)
    return count if node.nil?

    count += 1
    [height(node.left, count), height(node.right, count)].max
  end

  def depth(value)
    current_node = @root
    count = 0
    node = find(value)
    return if node.nil?

    until current_node.data == node.data
      current_node = node.data < current_node.data ? current_node.left : current_node.right
      count += 1
    end
    count
  end

  def balanced?(node = @root)
    return true if node.nil?
    return true if ((height(node.left) - height(node.right)).abs <= 1) && balanced?(node.left) && balanced?(node.right)

    false
  end

  def rebalanced!
    @root = build_tree(inorder)
  end

  def inorder(node = @root, output = [])
    return if node.nil?

    inorder(node.left, output)
    output << node.data
    inorder(node.right, output)
    output
  end

  def preorder(node = @root, output = [])
    return if node.nil?

    output << node.data
    preorder(node.left, output)
    preorder(node.right, output)
    output
  end

  def postorder(node = @root, output = [])
    return if node.nil?

    postorder(node.left, output)
    postorder(node.right, output)
    output << node.data
    output
  end

  def level_order(node = @root, queue = [], output = [])
    output << node.left.data unless node.left.nil?
    output << node.right.data unless node.right.nil?
    queue << node.left unless node.left.nil?
    queue << node.right unless node.right.nil?

    return output.unshift(@root.data) if queue.empty?

    level_order(queue.shift, queue, output)
  end

  def find(value, node = @root)
    return node if value == node.data || node.nil?

    if value < node.data
      find(value, node.left)
    else
      find(value, node.right)
    end
  end

  def build_tree(arr)
    return nil if arr.empty?

    mid = arr.length / 2
    root = Node.new(arr[mid])

    root.left = build_tree(arr.take(mid))
    root.right = build_tree(arr.drop(mid + 1))
    root
  end

  def insert(value, node = @root)
    return Node.new(value) if node.nil?

    return node if node.data == value

    if node.data < value
      node.right = insert(value, node.right)
    else
      node.left = insert(value, node.left)
    end
    node
  end

  def delete(value, node = @root)
    return node if node.nil?

    if value < node.data
      node.left = delete(value, node.left)
    elsif value > node.data
      node.right = delete(value, node.right)
    else
      return node.right if node.left.nil?
      return node.left if node.right.nil?

      current_node = node.right
      left_node = current_node.left until node.left.nil?
      node.data = left_node.data
      node.right = delete(left_node.data, node.right)
    end
    node
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
