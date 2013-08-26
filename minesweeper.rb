require_relative "board.rb"

class Minesweeper
  attr_accessor :game_board

  def initialize
    self.game_board = Board.new(size_of_board)

  end

  def size_of_board
    puts "Would you like a 9x9 board or a 16x16 board? Type 9 or 16."

    answer = gets.chomp.to_i
  end
end