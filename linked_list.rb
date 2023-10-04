class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
    @node_count = 0
  end

  # def check_head_tail
  #   sum = 0
  #   if @head.nil? then sum += 1 end
  #   if @tail.nil? then sum += 2 end
  #   sum
  # end

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
  end

  def pop
    # remove last element from list
    @node_count -= 1
  end

  def contains?(value)
    # return true if the value is in the list, otherwise return false
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

    # represent linked list objects as strings so you can print them out and preview them in the console
    # format should be ( value ) -> ( value ) -> ( value ) -> nil
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
new_list.append('last')
new_list.prepend('first')
new_list.append('replacement last')
new_list.prepend('replacement first')
# p new_list.head
# p new_list.tail
puts new_list.size
new_list.to_s(new_list, new_list.head)
# puts new_list.check_head_tail
