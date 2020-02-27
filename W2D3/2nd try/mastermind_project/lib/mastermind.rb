require_relative "code"

class Mastermind
    def initialize(number)
        @secret_code = Code.random(number)
    end

    def print_matches(code)
        print @secret_code.num_near_matches(code)
        print @secret_code.num_exact_matches(code)
    end

    def ask_user_for_guess
        print 'Enter a code'
        guess = Code.from_string(gets.chomp)
        print_matches(guess)
        guess == @secret_code
    end
end
