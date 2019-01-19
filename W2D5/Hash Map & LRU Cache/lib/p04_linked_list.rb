require "byebug"

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
    self.prev.next, self.next.prev = self.next, self.prev
  end
end

class LinkedList
  include Enumerable

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
    @head.next == @tail ? @head : @head.next
  end

  def last
    @tail.prev == @head ? @tail : @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    each do |node|
      return node.val if node.key == key 
    end 
    nil 
  end

  def include?(key)
    self.any? {|node| node.key == key}
  end

  def append(key, val)
    n = Node.new(key, val)
    n.prev = self.last 
    n.next = @tail 
    self.last.next = n 
    @tail.prev = n
    @head.next = n if @head.next == @tail 
  end

  def update(key, val)
    each do |node|
      node.val = val if node.key == key 
    end 
  end

  def remove(key)
    each do |node|
      if node.key == key 
        node.remove 
        node.val = nil
      end 
    end
  end

  def each(&prc)
    array = Array.new 
    node = @head.next
    # debugger 
    until node.val.nil? 
      prc.call(node)
      node = node.next 
    end
  end 

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end

if __FILE__ == $PROGRAM_NAME 
  a = LinkedList.new 
  a.append(1,2)
  p a 
  p a[1]
  p a[0]
end