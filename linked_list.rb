class LinkedList
  attr_accessor :head, :tail, :node_count

  def initialize
    @head = nil
    @tail = nil
    @node_count = 0
  end

  def append(value)
    new_node = Node.new
    new_node.add_value(value)
    if @head.nil? then @head = new_node end
    unless @tail.nil?
      @tail.next_node = new_node
    end
    @tail = new_node
    @node_count += 1
  end

  def prepend(value)
    new_node = Node.new
    new_node.add_value(value)
    if @tail.nil? then @tail = new_node end
    unless @head.nil?
      new_node.next_node = @head
    end
    @head = new_node
    @node_count += 1
  end

  def size
    @node_count
  end

  def head
    @head
  end

  def tail
    @tail
  end

  def at(index)
    # return node at given index
    index = 0
  end

  def pop
    # removes last element from list
    current_node = @head
    until current_node.next_node == @tail
      current_node = current_node.next_node
    end
    @tail = current_node
    current_node.next_node = nil
    @node_count -= 1
  end

  def contains?(value)
    # return true if the value is in the list, otherwise return false
    current_node = @head
    until current_node.next_node.nil?
      if current_node.value == value
        return true
      end
      current_node = current_node.next_node
    end
    return false
  end

  def find(value)
    # return the index of the node containing value, or nil if not found
  end

  def to_s(list, node)
    print "( #{node.value} ) -> "
    if node.next_node.nil?
      puts 'nil'
      return
    end
    list.to_s(list, node.next_node)
  end

  def insert_at(value, index)
    # extra credit
    # inserts a new node with the provided value at the given index
  end

  def remove_at(index)
    # extra credit
    # remove the node at the given index
  end
end

class Node
  attr_accessor :next_node, :value

  def initialize
    @next_node = nil
    @value = nil
  end

  def add_value(value)
    @value = value
  end
end

new_list = LinkedList.new
new_list.append('this 3rd')
new_list.prepend('then this')
new_list.append('and this one last')
new_list.prepend('this should be first')
# p new_list.head
# p new_list.tail
puts new_list.size
new_list.to_s(new_list, new_list.head)
new_list.pop
new_list.to_s(new_list, new_list.head)
puts new_list.contains?('then this')
