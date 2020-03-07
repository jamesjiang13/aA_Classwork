#time is O(n) + O(n^2) + 2*O(n^2) + O(n) => O(n^2)
def windowed_max_range(array, window_size)
  current_max_range = nil
  last = array.length - window_size # O(n)

  (0..last).each do |start| # O(n)
    window = array[start...start+window_size] # O(n)
    diff = window.max - window.min # 2*O(n)
    current_max_range = diff if !current_max_range || diff > current_max_range # O(1)
  end
  current_max_range
end

# p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
# p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8


class MyQueue
  attr_reader :store    # possibly private

  def initialize
    @store = []
  end

  def peek
    store[0]
  end

  def size
    store.length
  end

  def empty?
    size == 0
  end

  def enqueue(ele)
    store << ele
  end
  
  def dequeue
    store.shift
  end
end

class MyStack
  attr_reader :store#, :max

  def initialize
    @store = []
    # @max = nil
  end

  def peek
    store[-1]
  end

  def size
    store.length
  end

  def empty?
    size == 0
  end

  def push(ele)
    store << ele
    max = ele if !max || ele > max 
  end
  
  def pop
    store.pop
  end

  def max
    
  end
end

class MyStackQueue
  attr_reader :in_stack
  
  def initialize
    @in_stack = MyStack.new
    @out_stack = MyStack.new
  end

  def size
    in_stack.length
  end

  def empty?
    in_stack.empty?
  end

  def enqueue(ele)
    instack.push(ele)
  end

  def dequeue
    until in_stack.empty?
      ele = in_stack.pop
      out_stack.push(ele)
    end
    @out_stack.pop
    until out_stack.empty?
      ele = out_stack.pop
      in_stack.push(ele)
    end
  end

  private
  attr_reader :out_stack
end

