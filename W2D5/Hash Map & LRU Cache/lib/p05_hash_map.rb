require_relative 'p04_linked_list'

class HashMap
  include Enumerable 
  attr_accessor :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    
  end

  def set(key, val)
    hashed_val = [key, val].hash
    unless @store[hashed_val % num_buckets].include?(key)
      @store[hashed_val % num_buckets].append(key, val)
    end
  end

  def get(key)
    @store.each do |list|
      list.each do |node|
        return node.val if node.key == key
      end
    end
    nil
  end

  def delete(key)
  end

  def each(&prc)
    @store.each do |list|
      list.each do |node|
        prc.call([node.key, node.value])
      end 
    end 
  end 

  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
  end
end
