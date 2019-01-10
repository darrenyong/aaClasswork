require 'byebug'

# Warmup
def range(start_val, end_val)
  return [] if (end_val <= start_val)
  [start_val] + range(start_val+1, end_val)
end

# Exponentiation
# Recursion 1
def exp_v1(base, n)
  return 1 if n == 0
  base * exp_v1(base, n-1)
end

# Recursion 2
def exp_v2(base, n)
  return 1 if n == 0
  return base if n == 1

  if n.odd?
    base * exp_v2(base, (n-1)/2)**2
  else
    (exp_v2(base, n/2))**2
  end

end


#Deep dup - Array

class Array

    def deep_dup
      return [] if self.length == 0
      dup_arr = []

      self.each do |el|
        if el.is_a?(Array)
          temp = el.deep_dup
          dup_arr << temp
        else
          dup_arr << el
        end
      end

      dup_arr
    end

end

#Fibonacci

def fib(n)
  return nil if n < 1
  return [1] if n == 1
  return [1, 1] if n == 2

  prev_result = fib(n-1)

  prev_result << prev_result[-2..-1].reduce(&:+)

end

# Binary Search
def bsearch(array, target)
  return nil if array.length < 1

  search_idx = (array.length)/2
  if array[search_idx] == target
    return search_idx
  elsif target < array[search_idx]
    return search_idx = bsearch(array[0...search_idx], target)
  else
    return nil if bsearch(array[search_idx+1..-1], target) == nil
    return (search_idx + 1 + bsearch(array[search_idx+1..-1], target))
  end
end

# Merge Sort

def merge_sort(arr)
  return arr if arr.length <= 1

  mid_idx = arr.length / 2
  first_half = arr[0...mid_idx]
  last_half = arr[mid_idx..-1]

  merge(merge_sort(first_half), merge_sort(last_half))
end

def merge(arr1, arr2)
  new_arr =[]

  while arr1.length > 0 || arr2.length > 0
    if arr1.empty?
      new_arr << arr2.shift
    elsif arr2.empty?
      new_arr << arr1.shift
    elsif arr1.first < arr2.first
      new_arr << arr1.shift
    elsif
      new_arr << arr2.shift
    end
  end

  new_arr
end

# Array Subsets
def subsets(arr)
  return [[]] if arr.length == 0

  last_ele = arr[-1]
  res_arr = subsets(arr[0...-1])
  
  new_arr = res_arr.map do |ele|
    ele + [last_ele]
  end

  res_arr + new_arr
end

# Permuations
def permutations(arr)
  return [arr] if arr.length <= 1

  last_ele = arr[-1]
  res_arr = permutations(arr[0...-1])

  new_arr = []
  res_arr.each do |el|
    idx = el.length
    while idx >= 0
      new_el = el.dup
      new_el.insert(idx, last_ele)
      new_arr << new_el
      idx -= 1
    end
  end

  new_arr
end


# Greedy Make Change
def greedy_make_change(num, coins_arr)
  return [] if num == 0
  result_arr = []
  first_coin = coins_arr[0]
  if num - first_coin >= 0
    result_arr += [first_coin]
    result_arr += greedy_make_change(num-first_coin, coins_arr)
  else
    result_arr += greedy_make_change(num, coins_arr[1..-1])
  end

  result_arr
end

def make_better_change(num, coins_arr)
  return [] if num == 0
  result_arr = []

  # num_same_coins = nil
  
  coins_arr.each do |coin|
    if num % coin == 0 && coin != 1
      num_coins = num / coin
      num_coins.times do 
        result_arr << coin
      end
      # return result_arr
    end
  end

  first_coin = coins_arr[0]
  if num - first_coin >= 0
    result_arr += [first_coin]
    result_arr += make_better_change(num-first_coin, coins_arr)
  else
    result_arr += make_better_change(num, coins_arr[1..-1])
  end

  gmc_arr = greedy_make_change(num,coins_arr)
  
  gmc_arr.length < result_arr.length ? gmc_arr : result_arr

end