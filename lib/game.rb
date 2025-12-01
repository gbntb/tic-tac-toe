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

  # rubocop: disable Metrics/AbcSize
  def main_loop
    until board.line? || board.full?
      players.each do |player|
        print "#{player.name} : "
        board.player_input(player, gets.chomp)
        board.display
        break if board.line? || board.full?
      end
    end
  end
  # rubocop: enable Metrics/AbcSize

  private

  attr_writer :players, :board
end
