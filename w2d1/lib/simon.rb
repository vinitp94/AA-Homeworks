class Simon
  COLORS = %w(red blue green yellow).freeze

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    puts "Hello player! Tell me the sequence that I show you. Good luck!"

    until game_over
      take_turn
    end

    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    user_input = require_sequence

    if user_input == seq
      round_success_message
    else
      @game_over = true
    end

    @sequence_length += 1
  end

  def show_sequence
    add_random_color
    seq.each do |color|
      puts color
      sleep(1)
      system("clear")
    end
  end

  def require_sequence
    puts "What was the sequence?"
    gets.chomp.split(" ")
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    system("clear")
    puts "Onto the next round!"
    puts "Score: #{sequence_length}"
    sleep(2)
    system("clear")
  end

  def game_over_message
    puts "You lose. Let's try again!"
    sleep(2)
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

# Simon.new.play
