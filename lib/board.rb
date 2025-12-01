# frozen_string_literal: true

# The Board class represents the board on which the game happens.
# We also will add some functionality like checking to see wether we have
# a full line of identical symbol, wether the board is full, etc...
class Board
  attr_reader :winner_letter

  def initialize
    @array = Array.new(3) { Array.new(3, ' ') }
    @winner_letter = nil
  end

  def display
    puts '-------------'
    display_line(0)
    display_line(1)
    display_line(2)
    puts '-------------'
  end

  def line?
    return true if horizontal_line? || vertical_line? || down_diagonal_line? || up_diagonal_line?

    false
  end

  def full?
    return true if array.flatten.reject { |e| e == ' ' }.count == 9

    false
  end

  def player_input(player, input)
    parsed_input = input.chars.collect(&:to_i)
    return nil unless array.dig(parsed_input.first, parsed_input.last) == ' '

    array[parsed_input.first][parsed_input.last] = player.letter
  end

  private

  attr_accessor :array
  attr_writer :winner_letter

  def display_line(index)
    puts "- #{array.dig(index, 0)} - #{array.dig(index, 1)} - #{array.dig(index, 2)} -"
  end

  def horizontal_line?
    array.each do |line|
      element = line.first
      next if element == ' '

      count = 1
      2.times { |i| count += 1 if line[i + 1] == element }
      self.winner_letter = element if count == 3
      return true if count == 3
    end
    false
  end

  def vertical_line?
    array.first.each_with_index do |element, element_index|
      next if element == ' '

      count = 1
      2.times { |i| count += 1 if array.dig(i + 1, element_index) == element }
      self.winner_letter = element if count == 3
      return true if count == 3
    end
    false
  end

  def down_diagonal_line?
    element = array.first.first
    return false if element == ' '

    count = 1
    array.each_with_index do |line, index|
      next if index == 1

      count += 1 if line[index] == element
    end
    self.winner_letter = element if count == 3
    return true if count == 3

    false
  end

  def up_diagonal_line?
    element = array.first.last
    return false if element == ' '

    if (array.dig(1, 1) == element) && (array.dig(2, 0) == element)
      self.winner_letter = element
      return true
    end
    false
  end
end
