require "byebug"
class MaxIntSet
  attr_reader :store

  def initialize(max)
    @store = Array.new(max,false)
  end

  def insert(num)
    is_valid?(num)
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    raise 'Out of bounds' if !(num >= 0 && num < @store.length)
  end

  # def validate!(num)
  # end
end


class IntSet

  def initialize(buckets = 20)
    @store = Array.new(buckets) {[]}
    @buckets = buckets
  end

  def [](num)
    @store[num % @buckets]
  end

  def insert(num)
    bucket = num % @buckets
    @store[bucket] << num if !@store[bucket].include?(num)
  end

  def remove(num)
    bucket = num % @buckets
    @store[bucket].delete(num)
  end

  def include?(num)
    bucket = num % @buckets
    @store[bucket].include?(num)
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
    # debugger
    if @count == num_buckets
      resize!
    end

    bucket = num % num_buckets
    
    if !self.include?(num)
      @store[bucket] << num 
      @count += 1
    end

  end

  def remove(num)
    bucket = num % num_buckets
    if include?(num)
      @store[bucket].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    bucket = num % num_buckets
    @store[bucket].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    # prev_length = num_buckets
    # num_buckets.times {
    #   @store << Array.new
    # }

    # (0...prev_length).each do |i| 
    #   bucket.each do |num|
    #     new_location = num % num_buckets
    #     @store

    new_array = Array.new(num_buckets*2) {Array.new}
    p new_array.length
    @store.each do |bucket|
      bucket.each do |num|
        new_array[num % new_array.length] << num
      end
    end
    @store = new_array
  end

end

# set = ResizingIntSet.new(5)
# p set
# dummy = [1,2,3,4,5]
# dummy.each { |num| set.insert(num) }
# p set
# set.insert(6)
# p set

