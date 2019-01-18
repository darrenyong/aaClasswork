# Windowed Range

# Phase 1
def wmx(arr, window)
  cmax_range = 0

  arr.each_index do |idx|
    last_idx = idx+window
    next if last_idx > arr.length
    sub_arr = arr[idx...last_idx]
    diff = sub_arr.max - sub_arr.min
    cmax_range = diff if diff > cmax_range
  end

  cmax_range
end

# wmx([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
# wmx([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
# wmx([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# wmx([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8