class Move

  attr_accessor :move_type, :move_coords, :board

  def initialize(move_input, board)
    self.move_type = move_input.first
    self.move_coords = move_input[1]
    self.board = board
  end

  def reveal

  end

  def flag
    row, col = move_coords
    board[row][col] = "F" if board[row][col] == "*"
  end

  def unflag
    row, col = move_coords
    board[row][col] = "*" if board[row][col] == "F"
  end

end