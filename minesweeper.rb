require_relative "board.rb"
require_relative "move.rb"
require_relative "user.rb"


class Minesweeper
  attr_accessor :game_board, :user, :board_dimension

  def initialize
    self.game_board = Board.new(size_of_board)
    self.user = User.new
    self.board_dimension = size_of_board
  end

  def size_of_board
    puts "Would you like a 9x9 board or a 16x16 board? Type 9 or 16."

    answer = gets.chomp.to_i
  end

  def show_board
    game_board.draw_board # may need more detail
  end

  def play
    show_board

    loop do

      move_input = user.move
      new_move = Move.new(move_input, game_board, board_dimension)
      p game_board
      show_board
    end

  end
end