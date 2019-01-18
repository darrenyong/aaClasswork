#anagrams

def first_anagram(string, target)
  # time complexity O(n!)
  combos = string.chars.permutation.to_a
  combos.include?(target.chars)
end 

def second_anagram(string, target)
  # time complexity O(n)
  chars = target.chars 

  string.each_char do |char|
    idx = chars.index(char)
    next if idx.nil?
    chars.delete_at(idx)
  end 

  chars.empty? 
end 

def third_anagram(string, target)
  # time complexity O(n)? ot O(1)
  string.chars.sort == target.chars.sort
end

def fourth_anagram(string, target)
  # time complexity O(n squared)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)

  string.chars.each do |ele|
    hash1[ele] += 1
  end

  target.chars.each do |ele|
    hash2[ele] += 1
  end

  hash1 == hash2
end

def bonus_anagram(string, target)
  # time complexity O(n squared)
    hash1 = Hash.new(0)
  
    string.chars.each do |ele|
      hash1[ele] += 1
    end
  
    target.chars.each do |ele|
      hash1[ele] -= 1
    end
  
    !hash1.values.any? {|ele| ele < 0}
  end