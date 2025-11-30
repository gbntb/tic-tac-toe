# frozen_string_literal: true

# The Board class represents the board on which the game happens.
# We also will add some functionality like checking to see wether we have
# a full line of identical symbol, wether the board is full, etc...
class Board
  attr_accessor :array

  def initialize
    @array = Array.new(3) { Array.new(3, ' ') }
  end

  # rubocop: disable Metrics/AbcSize
  def display
    puts '-------------'
    puts "- #{array.dig(0, 0)} - #{array.dig(0, 1)} - #{array.dig(0, 2)} -"
    puts "- #{array.dig(1, 0)} - #{array.dig(1, 1)} - #{array.dig(1, 2)} -"
    puts "- #{array.dig(2, 0)} - #{array.dig(2, 1)} - #{array.dig(2, 2)} -"
    puts '-------------'
  end
  # rubocop: enable Metrics/AbcSize
end
