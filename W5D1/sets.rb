class MaxIntSet
  attr_reader :store

  def initialize(max)
    @store = Array.new(max,false)
  end

  def insert(num)
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end
end

# set = MaxIntSet.new(10)
# p set
# set.insert(5)
# p set

class IntSet

  def initialize
    @store = Array.new(20) {[]}
  end

  def [](num)
    @store[num % 20]
  end

  def insert(num)
    bucket = num % 20
    @store[bucket] << num if !@store[bucket].include?(num)
  end

  def remove(num)
    bucket = num % 20
    @store[bucket].delete(num)
  end

end

# set = IntSet.new
# p set
# set.insert(5)
# p set
# set.insert(21)
# p set
# set.insert(23)
# p set










