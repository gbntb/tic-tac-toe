# frozen_string_literal: true

require_relative 'player'
require_relative 'board'

# Main Game class. This is where it all comes together.
class Game
  attr_reader :players, :board

  def initialize
    self.players = [Player.new('Player 1', 'X'), Player.new('Player 2', 'O')]
    self.board = Board.new
  end

  private

  attr_writer :players, :board
end
