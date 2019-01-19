class MaxIntSet
  def initialize(max)
    @store = Array.new(max)
  end

  def insert(num)
    raise "Out of bounds" if num > @store.length || num < 0
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num] == true
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  attr_reader :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @num_buckets = num_buckets
  end

  def insert(num)
    @store[num % num_buckets] << num #unless store[num % num_buckets].include?(num)
  end

  def remove(num)
    store[num % num_buckets].delete(num)
  end

  def include?(num)
    store[num % num_buckets].include?(num) 
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
     unless @store[num % num_buckets].include?(num)
      @store[num % num_buckets] << num 
      @count += 1
     end

     resize! if count > num_buckets
  end

  def remove(num)
     if @store[num % num_buckets].include?(num)
      @store[num % num_buckets].delete(num)
      @count -= 1 
     end 
  end

  def include?(num)
    @store[num % num_buckets].include?(num) 
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
