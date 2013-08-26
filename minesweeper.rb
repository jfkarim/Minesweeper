require_relative "board.rb"

class Minesweeper
  attr_accessor :game_board, :user

  def initialize
    self.game_board = Board.new(size_of_board)
    self.user = User.new
  end

  def size_of_board
    puts "Would you like a 9x9 board or a 16x16 board? Type 9 or 16."

    answer = gets.chomp.to_i
  end

  def show_board
    puts game_board # may need more detail
  end

  def play
    loop do
      show_board

      # make move
      move_input = user.move
      new_move = Move.new(move_input)

      show_board
    end
  end
end