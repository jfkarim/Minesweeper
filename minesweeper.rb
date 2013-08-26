require_relative "board.rb"
require_relative "move.rb"
require_relative "user.rb"
require "yaml"


class Minesweeper
  attr_accessor :game_board, :user, :board_dimension, :flag_count

  def initialize
    load?
    self.game_board = Board.new(size_of_board) if self.game_board.nil?
    self.user = User.new
    self.board_dimension = game_board.dimension
  end

  def size_of_board
    puts "Would you like a 9x9 board or a 16x16 board? Type 9 or 16."

    answer = gets.chomp.to_i
  end

  def original_flag_count
    if board_dimension == 9
      return 10
    elsif board_dimension == 16
      return 40
    end
  end

  def update_flag_count
    # use board to count number of flags
    flag_count = original_flag_count
    game_board.board.each do |row|
      row.each do |spot|
        if spot == 'x' || spot == 'F'
          flag_count -= 1
        end
      end
    end

    # print number left
    puts "#{flag_count} flags remaining"
  end

  def win?
    game_board.board.each do |row|
      row.each do |spot|
        if spot == '*' || spot == 'F' # false flags
          return false
        end
      end
    end
    puts "#{user.name}, you WIN!!"
    true
  end

  def lose?(new_move, move_input)
    if new_move.reveal == 'lose' && move_input[0] == 'r'
      puts "#{user.name}, you lose!!! LOSER!!"
      return true
    end
    false
  end


  def save_game
    yaml = game_board.to_yaml
    puts "Save under what name?"
    save_name = gets.chomp.downcase << ".ms"
    File.open("#{save_name}", "w") do |f|
      f.puts yaml
    end
  end

  def save?
    puts "Save game? (y/n)"
    answer = gets.chomp.downcase[0]
    save_game if answer == "y"
  end

  def load_game
    puts "What is your file name?"
    load_name = gets.chomp.downcase << ".ms"
    load_target = File.read("#{load_name}")
    self.game_board = YAML::load(load_target)
  end

  def load?
    puts "Would you like to load a game? (y/n)"
    answer = gets.chomp.downcase[0]
    if answer == 'y'
      load_game
    end
  end

  def show_board
    game_board.draw_board
  end

  def play
    start = Time.now
    show_board

    loop do

      move_input = user.move
      new_move = Move.new(move_input, game_board, board_dimension)
      p game_board #optional (for dev use)
      show_board
      update_flag_count
      break if win?
      break if lose?(new_move, move_input)
      save?

    end

    total_time = Time.now - start
    puts "Time taken to finish: #{total_time}"
  end
end

ms = Minesweeper.new
ms.play