# frozen_string_literal: true

# This is where our players get defined. All in all a very simple class.
class Player
  attr_reader :name, :letter

  def initialize(name, letter)
    self.name = name
    self.letter = letter
  end

  private

  attr_writer :name, :letter
end
