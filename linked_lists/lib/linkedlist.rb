class LinkedList
  attr_reader :head
  def initialize
    @head = nil
  end
  
  def append(value)
    if @head.nil?
      @head = Node.new(value)
    else
      current_node = @head
      new_node = Node.new(value)

      while current_node.next_node != nil
        current_node = current_node.next_node
      end
      current_node.next_node = new_node
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
  end
  
  
  def to_s
    current_node = @head
    output = []
    while current_node != nil
      if current_node.next_node == nil
        output << "( #{current_node.value} ) -> nil"
        current_node = current_node.next_node
      else
        output << "( #{current_node.value}) -> "
        current_node = current_node.next_node
      end  
    end
    output.join('')
    
  end
end
