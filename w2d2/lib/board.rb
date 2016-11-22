require 'byebug'
class Board
  attr_accessor :cups
  attr_reader :name1, :name2

  def initialize(name1, name2)
    @cups = Array.new(14) { [] }
    @name1 = name1
    @name2 = name2
    place_stones
  end

  def place_stones
    cups.each_index do |i|
      cups[i] = [:stone, :stone, :stone, :stone] unless i == 6 || i == 13
    end
  end

  def valid_move?(start_pos)
    unless (1..6).to_a.include?(start_pos) || (7..12).to_a.include?(start_pos)
      raise "Invalid starting cup"
    end
  end

  def make_move(start_pos, current_player_name)
    #debugger
    num_stones = cups[start_pos].count
    cups[start_pos] = []
    pos = start_pos + 1

    if current_player_name == name1
      until num_stones == 0
        if pos != 13
          cups[pos] << :stone
          num_stones -= 1
        end
        pos = (pos + 1) % 14
      end
    elsif current_player_name == name2
      until num_stones == 0
        if pos != 6
          cups[pos] << :stone
          num_stones -= 1
        end
        pos = (pos + 1) % 14
      end
    end

    render
    next_move = next_turn(pos - 1, current_player_name)
    return next_move if next_move
    pos - 1
  end

  def next_turn(ending_cup_idx, current_player_name)
    if current_player_name == name1 && ending_cup_idx == 6
      return :prompt
    elsif current_player_name == name2 && ending_cup_idx == -1
      return :prompt
    elsif cups[ending_cup_idx].count == 1
      return :switch
    end
    nil
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if cups[0..5].all?(&:empty?) || cups[7..12].all?(&:empty?)
    false
  end

  def winner
    six_stones = [:stone, :stone, :stone, :stone, :stone, :stone]
    return :draw if cups[6] == six_stones && cups[13] == six_stones
    return name1 if cups[6] == six_stones && cups[13] != six_stones
    return name2 if cups[13] == six_stones && cups[6] != six_stones
    nil
  end
end
