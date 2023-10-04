class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    new_node = Node.new
    new_node.add_value(value)
    if @head.nil? then @head = new_node end
    unless @tail.nil?
      @tail.next_node = new_node
    end
    @tail = new_node
  end

  def prepend(value)
    new_node = Node.new
    new_node.add_value(value)
    if @tail.nil? then @tail = new_node end
    unless @head.nil?
      new_node.next_node = @head
    end
    @head = new_node
  end

  def size
    current_node = @head
    count = 0
    if @head.nil?
      return count
    end

    loop do
      count += 1
      if current_node.next_node.nil?
        break
      end

      current_node = current_node.next_node
    end
    count
  end

  def head
    @head
  end

  def tail
    @tail
  end

  def at(index)
    # return node at given index
    current_node = @head
    count = 0
    loop do
      if count == index
        return current_node
      end

      if current_node.next_node.nil?
        break
      end

      current_node = current_node.next_node
      count += 1
    end
  end

  def pop
    # removes last element from list
    current_node = @head
    until current_node.next_node.nil?
      current_node = current_node.next_node
    end
    @tail = current_node
    current_node.next_node = nil
  end

  def contains?(value)
    # return true if the value is in the list, otherwise return false
    current_node = @head
    loop do
      if current_node.value == value
        return true
      end

      if current_node.next_node.nil?
        break
      end

      current_node = current_node.next_node
    end
    false
  end

  def find(value)
    # return the index of the node containing value, or nil if not found
    current_node = @head
    index = 0
    loop do
      if current_node.value == value
        return index
      end

      if current_node.next_node.nil?
        break
      end

      current_node = current_node.next_node
      index += 1
    end
    return nil
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
    # inserts a new node with the provided value at the given index
    new_node = Node.new
    new_node.add_value(value)
    node = self.at(index)
    prior_node = self.at(index - 1)
    prior_node.next_node = new_node
    new_node.next_node = node
  end

  def remove_at(index)
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
new_list.to_s(new_list, new_list.head)
new_list.pop
new_list.to_s(new_list, new_list.head)
print 'contains: '
puts new_list.contains?('and this one last')
print 'find: '
puts new_list.find('and this one last')
print 'at: '
puts new_list.at(3)
print 'size: '
puts new_list.size
puts new_list.insert_at('hello', 2)
new_list.to_s(new_list, new_list.head)
