# frozen_string_literal: true

class HashMap
  def initialize
    @load_factor = 0.75
    @capacity = 16
    @buckets = Array.new(@capacity) { LinkedList.new }
    @size = 0
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
    hash_code % @capacity
  end

  def set(key, value)
    resize if @size >= @load_factor * @capacity
    index = hash(key)

    if @buckets[index].contains?(key)
      index_of_key = @buckets[index].find(key)
      @buckets[index].at(index_of_key).value = value
    else
      @buckets[index].prepend(key, value)
      @size += 1
    end
  end

  def get(key)
    if has?(key)
      index = hash(key)
      index_of_key = @buckets[index].find(key)
      return @buckets[index].at(index_of_key).value
    end
    nil
  end

  def has?(key)
    keys.include?(key)
  end

  def remove(key)
    if keys.include?(key)
      index = hash(key)
      index_of_key = @buckets[index].find(key)
      removed_node = @buckets[index].remove_at(index_of_key)
      return removed_node.value
    end
    nil
  end

  def length
    @size
  end

  def clear
    @capacity = 16
    @buckets = Array.new(@capacity) { LinkedList.new }
    nil
  end

  def keys
    output = []
    @buckets.each do |bucket|
      current_node = bucket.head

      until current_node.nil?
        output << current_node.key
        current_node = current_node.next_node
      end
    end
    output
  end

  def values
    output = []
    @buckets.each do |bucket|
      current_node = bucket.head

      until current_node.nil?
        output << current_node.value
        current_node = current_node.next_node
      end
    end
    output
  end

  def entries
    output = []
    @buckets.each do |bucket|
      current_node = bucket.head
      until current_node.nil?
        output << [current_node.key, current_node.value]
        current_node = current_node.next_node
      end
    end
    output
  end

  def resize
    @capacity *= 2
    contents = entries
    @size = 0

    @buckets = Array.new(@capacity) { LinkedList.new }
    contents.each do |content|
      set(content[0], content[1])
    end
  end

  def hashmap_display
    output = ''
    @buckets.each_with_index do |bucket, index|
      output += "\nBucket Index: #{index}  Bucket Size: #{bucket.size} Bucket Content: #{bucket}\n"
    end
    output
  end
end
