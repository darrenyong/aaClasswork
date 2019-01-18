# My Min
def my_min1(arr)
  # time complexity = O(n squared) 
  arr.each_with_index do |ele1, idx1|
    copy = arr.dup
    copy.delete(ele1)
    return ele1 if copy.all? {|ele| ele1 < ele }   
  end 
end 

def my_min2(arr)
  # time complexity = O(n)
  min = arr.first
  arr[1..-1].each do |ele|
    min = ele if ele < min
  end 
  min
end 

# Largest Contiguous Sub-Sum
def lcss1(arr)
  # time complexity = O(n squared)
  result_arr = []

  arr.each_with_index do |ele1, idx1|
    arr.each_with_index do |ele2, idx2|
      if idx2 >= idx1
        result_arr << arr[idx1..idx2]
      end
    end
  end

  sum_arr = result_arr.map(&:sum).max
end

def lcss2(arr)
  max = arr.first
  current_sum = 0

  arr.each do |ele|
    current_sum += ele
    if current_sum > max
      max = current_sum
    elsif current_sum < 0
      current_sum = 0
    end
  end

  max
end