class Board
  attr_accessor :board, :dimension

  def initialize(dimension)
    self.board = []
    self.dimension = dimension
    dimension.times { board << Array.new(dimension, '*'.dup) }
    mines = mine_initialize(dimension)
  end

  def mine_initialize(dimension)
    # will hide mines
    mine_positions = []

    if dimension == 9
      until mine_positions.length == 10
        row = (0...9).to_a.sample
        col = (0...9).to_a.sample
        mine_positions << [row, col] unless board[row][col] == 'm'
        board[row][col] = 'm'
      end
    else
      until mine_positions.length == 40
        row = (0...16).to_a.sample
        col = (0...16).to_a.sample
        mine_positions << [row, col] unless board[row][col] == 'm'
        board[row][col] = 'm'
      end
    end

    mine_positions
  end

  def draw_board
    row_strings = []
    board.each do |row|
      row_strings << row.join("")
    end

    board_string = row_strings.join("\n")

    drawing_board = board_string.gsub(/m/,"*")
    puts drawing_board.gsub(/x/, "F")
  end

end