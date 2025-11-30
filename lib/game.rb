# frozen_string_literal: true

# Main Game class. This is where it all comes together.
class Game
  attr_reader :player1, :player2, :board

  def initialize
    self.player1 = Player.new('Player 1', 'X')
    self.player2 = Player.new('Player 2', 'O')
    self.board = Board.new
  end

  private

  attr_writer :player1, :player2, :board
end
