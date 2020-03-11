
class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable
  attr_reader :head, :tail

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    self[1]
  end

  def last
    self[-2]
  end

  def empty?
    @head.next == @tail && @tail.prev == @head
  end

  def get(key)
    # self.each { |node| return node.val if node.key == key }
    current = self.head.next
    print current
    until current.next == nil
      return current.val if key == current.key
      current = current.next
    end
    nil
  end

  def include?(key)
  end

  def append(key, val)
    new_node = Node.new(key,val)
    old_node = last
    new_node.prev = old_node
    new_node.next = @tail
    old_node.next = new_node
  end

  def update(key, val)
  end

  def remove(key)
  end

  def each(&prc)
    current = self.head.next
    until current.next == nil
      prc.call(current)   # proc? 
      current = current.next
    end
    # prc.call(current) 
    self
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end

ll = LinkedList.new