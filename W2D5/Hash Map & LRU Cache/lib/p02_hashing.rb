class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    self.join("").to_i.hash
  end
end

class String
  def hash
    alphabet = ("a".."z").to_a 
    array = Array.new 

    self.each_char do |letter|
      array << alphabet.index(letter)
    end 

    array.join("").to_i.hash 
  end

end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    alphabet = ("a".."z").to_a 
    array = Array.new 

    self.to_a.sort.each do |sub_arr|
      sub_arr.each do |ele|
        if ele.is_a?(Integer)
          array << ele 
        else  
          array << alphabet.index(ele.to_s)
        end 
      end 
    end 

    array.join("").to_i.hash 
  end

end
