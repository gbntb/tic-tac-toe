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
    board.display
    until board.line? || board.full?
      players.each do |player|
        print "#{player.name} : "
        board.player_input(player, gets.chomp)
        board.display
        break if board.line? || board.full?
      end
    end
    game_over
  end
  # rubocop: enable Metrics/AbcSize

  def game_over
    if board.line?
      winner = players.select { |player| player.letter == board.winner_letter }.first.name
      puts "#{winner} wins the game!"
    else
      puts "It's a draw! Nobody wins, nobody loses!"
    end
  end

  private

  attr_writer :players, :board
end
