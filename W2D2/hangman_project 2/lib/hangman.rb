# words_doc = File.open('words.txt')

class Hangman
  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses
  DICTIONARY = File.open('words.txt').read.split("\n")#["cat", "dog", "bootcamp", "pizza"] #load "./word_list.txt"

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
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    new_arr = []
    @secret_word.each_char.with_index do |ch, idx|
      if char == ch
        new_arr << idx
      end
    end
    new_arr
  end

  def fill_indices(char, arr_indicies)
    arr_indicies.each do |idx|
      @guess_word[idx] = char
    end
  end

  def try_guess(char)
    if already_attempted?(char)
      puts 'that has already been attempted'
      return false
    end

    @attempted_chars << char
    matched = get_matching_indices(char) # return array of matching indices
    if !matched.empty? #if there is matching characters
      fill_indices(char, matched) #updates guess word
    else
      @remaining_incorrect_guesses -= 1
    end
    return true
  end

  def ask_user_for_guess
    puts 'Enter a char:'
    input = gets.chomp
    try_guess(input)
  end

  def win?
    if @guess_word.join("") == @secret_word
      puts 'WIN'
      return true
    end
   false
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts 'LOSE'
      return true
    end
    false
  end

  def game_over?
    if win? || lose?
      puts @secret_word
      return true
    end
    false
  end
end