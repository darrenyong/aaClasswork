require "byebug"
# two sum
def bad_two_sum?(arr, target)
  arr.each_with_index do |ele1, idx1|
    arr.each_with_index do |ele2, idx2|
      return true if ele1 + ele2 == target && idx1 < idx2
    end
  end
  false
end


# on a sorted array

def okay_two_sum?(arr, target)
  arr.each_with_index do |num,idx|
   
    subarray = arr[0...idx] + arr[idx+1..-1]
    diff = target  - num
    return true if bsearch(subarray, diff)
  end 
  false 
end


def bsearch(arr, target)
  return nil if arr.length == 0
  mid = arr.length / 2
  
  case arr[mid] <=> target
  when 0
    return mid
  when 1
    bsearch(arr[0...mid],target)
  when -1
    search = bsearch(arr[mid+1..-1],target)
    search.nil? ? nil : mid + 1 + search
  end 

end 

def two_sum?(arr, target)
  hash = {}

  arr.each do |ele|
    difference = target - ele
    if difference == ele
      hash[ele] = false
    else
      hash[ele] = true
    end
    return true if hash[difference]
  end

  false
end