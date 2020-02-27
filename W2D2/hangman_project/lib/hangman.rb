class Hangman

  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses

  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word 
    DICTIONARY.sample
  end
  
  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    @attempted_chars.include?(char) ? true : false
  end
  
  def get_matching_indices(char)
    new_arr = []
    (0...@secret_word.length).each do |i|
      new_arr << i if @secret_word[i].include?(char)
    end
    new_arr
  end

  def fill_indices(char, arr)
    arr.each { |i| @guess_word[i] = char }
  end

  def try_guess(char)
    if already_attempted?(char)
      print 'that has already been attempted'
      return false
    elsif !@secret_word.include?(char)
      @remaining_incorrect_guesses -= 1 if get_matching_indices(char).length < 1 
      # @attempted_chars << char
      # true
    else
      matching = get_matching_indices(char)
      fill_indices(char, matching)
      # @attempted_chars << char
      # true
    end
    @attempted_chars << char
    true
  end

  def ask_user_for_guess
    print "Enter a char:"
    char = gets.chomp
    try_guess(char)
  end

  def win?
    if @guess_word.join("") == @secret_word
      print 'WIN'
      return true
    end
    false
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      print "LOSE"
      return true
    end
    false
  end

  def game_over?
    if win? || lose?
      print @secret_word
      return true
    end
    false 
  end

end


