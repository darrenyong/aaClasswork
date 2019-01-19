class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    buck_num = key.hash % num_buckets
    unless @store[buck_num].include?(key)
      @store[buck_num] << key 
      @count += 1
    end

    resize! if count > num_buckets
  end

  def include?(key)
    buck_num = key.hash % num_buckets
    @store[buck_num].include?(key)
  end

  def remove(key)
    buck_num = key.hash % num_buckets
    if @store[buck_num].include?(key)
      @store[buck_num].delete(key)
      @count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    temp_store = @store.dup
    @store = Array.new(num_buckets * 2) {Array.new}
    
    temp_store.each do |sub_arr|
      sub_arr.each do |ele|
          @store[ele % num_buckets] << ele
      end 
    end 
  end
end
