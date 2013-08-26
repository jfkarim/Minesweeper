class Move

  NEIGHBORS = [[1,1], [1,0], [1,-1], [0,1], [0,-1],
               [-1,1], [-1,0], [-1,-1]]

  attr_accessor :move_type, :move_coords, :board

  def initialize(move_input, board)
    self.move_type = move_input.first
    self.move_coords = move_input[1]
    self.board = board
  end

  def reveal
    row, col = move_coords
    current_square = board[row][col]

    raise "game over" if current_square == 'm' #for now

    # leave this for now, must do a check through all neighboring squares

    if current_square == '*'
      board[row][col] = '_'
      neighboring_empty_squares
    end

  end

  def adjacent_mines
    row, col = move_coords
    current_square = board[row][col]

    adj_mine_count = 0



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