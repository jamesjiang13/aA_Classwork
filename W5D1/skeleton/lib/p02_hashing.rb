class Integer
  # Integer#hash already implemented for you
end

class Array
  #[3,4] => [4,4]
  #[4,3] => [5,3]
  def hash
    total = 0
    (0...self.length - 1).each do |i|
      total += xor((self[i]+i).to_s(2),(self[i+1]).to_s(2))
    end
    total
  end

  private
  def xor(bin1, bin2)
    res = ''
    bin1.each_char.with_index do |char,i|
      char == bin2[i] ? res += '0' : res += "1"
    end
    res.to_i(3)
  end
end

class String
  def hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
