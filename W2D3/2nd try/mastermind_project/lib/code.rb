class Code
  attr_reader :pegs
  
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }
  def self.valid_pegs?(array_pegs)
    return true if array_pegs.all? {|peg| POSSIBLE_PEGS.include?(peg.upcase) }
    false
  end

  def initialize(arr_pegs)
    if Code.valid_pegs?(arr_pegs)
      @pegs = arr_pegs.map(&:upcase)
    else
      raise "Not valid pegs"
    end
  end

  def self.random(number)
    new_pegs = []
    number.times {new_pegs << POSSIBLE_PEGS.keys.sample}
    Code.new(new_pegs)
  end

  def self.from_string(str_pegs)
    Code.new(str_pegs.chars)
  end

  def [](idx)
    @pegs[idx]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(code)
    count = 0
    i = @pegs.length - 1
    (0..i).each {|idx| count += 1 if code[idx] == @pegs[idx] }
    count
  end

  def num_near_matches(guess)
    count = 0
    guess.pegs.each_with_index do |peg, idx|
      if @pegs.include?(peg.upcase) && @pegs[idx] != peg
        count += 1
      end
    end
    count
  end

  def ==(instance)
    self.pegs == instance.pegs
  end

end
