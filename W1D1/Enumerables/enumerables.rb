class Array
  # My Each
  def my_each(&blk)
    i = 0
    while i < length
      blk.call(self[i])
      i += 1
    end

    self
  end


  # My Select
  def my_select(&blk)
    new_arr = []
    self.my_each do |ele|
      new_arr << ele if blk.call(ele)
    end

    new_arr
  end

  # My Reject
  def my_reject(&blk)
    new_arr = []
    self.my_each do |ele|
      new_arr << ele if !blk.call(ele)
    end 

    new_arr 
  end 

  # My Any
  def my_any?(&blk)
    self.my_each do |ele|
      return true if blk.call(ele)
    end

    false
  end 

  # My All
  def my_all?(&blk)
    self.my_each do |ele|
      return false if !blk.call(ele)
    end

    true 
  end

  # My Flatten
  def my_flatten
    flattened_arr = []

    self.my_each do |ele|
      if !ele.is_a?(Array)
        flattened_arr << ele
      else 
        flattened_arr += ele.my_flatten
      end 
    end 

    flattened_arr
  end

  # My Zip
  def my_zip(*arr)
    zipped_arr = []
    i = 0

    my_each do |ele1|
      sub_arr = [ele1]
      arr.my_each do |ele2|
        sub_arr << ele2[i]
      end
      i += 1
      zipped_arr << sub_arr
    end

    zipped_arr
  end

  # My Rotate
  def my_rotate(shift = 1)
    shift = shift % self.length
    first_half = self[0...shift]
    second_half = self[shift..-1]
    return second_half + first_half
  end

  # My Join
  def my_join(seperator = "")
    joined_str = ""
    self.each.with_index do |ele, idx|
      if idx == self.length-1
        joined_str += ele
      else
        joined_str += (ele + seperator)
      end
    end

    joined_str
  end

  # My Reverse
  def my_reverse
    reversed_arr = []
    i = self.length - 1
    while i >= 0
      reversed_arr << self[i]
      i -= 1
    end

    reversed_arr
  end

  

end
