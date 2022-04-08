class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    return true if @attempted_chars.include?(char)

    false
  end

  def get_matching_indices(char)
    return [] if !@secret_word.include?(char)

    new_arr = []
    @secret_word.each_char.with_index { |letter, i| new_arr << i if letter == char }
    new_arr
  end

  def fill_indices(char, arr)
    arr.each { |num| @guess_word[num] = char}
  end

  def try_guess(char)
    attempted = self.already_attempted?(char)

    if attempted
      puts "that has already been attempted"
      return false
    elsif !attempted
      @attempted_chars << char
      matching_arr = self.get_matching_indices(char)
      guess_arr = self.fill_indices(char, matching_arr)
      @remaining_incorrect_guesses -= 1 if matching_arr == []
      return true
    end
  end

  def ask_user_for_guess
    puts "Enter a char: "
    letter = gets.chomp
    self.try_guess(letter)
  end

  def win?
    if @guess_word.join("") == @secret_word
      puts "WIN"
      return true
    else 
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts "LOSE"
      return true
    else
      return false
    end
  end

  def game_over?
    if self.win? || self.lose?
      puts @secret_word
      return true
    else
      return false
    end
  end
  
end
