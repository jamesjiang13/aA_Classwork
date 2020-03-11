# require_relative "p01_int_set"

class HashSet 
  attr_reader :count

  def initialize(num_buckets=8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if @count == num_buckets

    hashed = key.hash % num_buckets
    
    if !self.include?(key)
      @store[hashed] << key 
      @count += 1
    end

  end

  def include?(key)
    hashed = key.hash % num_buckets
    @store[hashed].include?(key)

  end

  def remove(key)
    hashed = key.hash % num_buckets
    if include?(key)
      @store[hashed].delete(key)
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
    new_array = Array.new(num_buckets * 2) {Array.new}
    @store.each do |bucket|
      bucket.each do |num|
        fucket = num.hash
        new_array[fucket % new_array.length] << num
      end
    end
    @store = new_array
  end

end
