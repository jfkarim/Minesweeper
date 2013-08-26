class Move

  NEIGHBOR_INCREMENTS = [[1,1], [1,0], [1,-1], [0,1], [0,-1],
               [-1,1], [-1,0], [-1,-1]]

  attr_accessor :move_type, :move_coords, :board, :dimension, :dimension_range, :board_arr

  def initialize(move_input, board, dimension)
    self.move_type = move_input.first
    self.move_coords = move_input[1]
    self.board = board
    self.board_arr = board.board
    self.dimension = dimension
    self.dimension_range = (0...dimension).to_a

    if move_type == "r"
      self.reveal
    elsif move_type == "f"
      self.flag
    else
      raise("Invalid move type in Move class")
    end
  end

  def reveal
    row, col = move_coords
    current_square = board_arr[row][col]

    raise "game over" if current_square == 'm' #for now

    # leave this for now, must do a check through all neighboring squares

    if current_square == '*'
      adj_mine_count = adjacent_mines
      if adj_mine_count == 0
        board_arr[row][col] = '_'
        reveal_empty_neighbors
      else
        board_arr[row][col] = adj_mine_count # to_s?
      end
    end

  end

  def adjacent_mines
    row, col = move_coords
    current_square = board_arr[row][col]

    neighbors = adjacent_squares

    adj_mine_count = 0

    neighbors.each do |neighbor|
      new_row, new_col = neighbor.first, neighbor.last
      check_square = board_arr[new_row][new_col]

      if check_square == 'm'
        adj_mine_count += 1
      end
    end

    adj_mine_count

  end

  def adjacent_squares
    row, col = move_coords
    current_square = board_arr[row][col]

    adjacent_squares = []

    NEIGHBOR_INCREMENTS.each do |neighbor|
      new_row, new_col = row + neighbor.first, col + neighbor.last
      next unless dimension_range.include?(new_row)
      next unless dimension_range.include?(new_col)# here
      adjacent_squares << [new_row, new_col]
    end

    adjacent_squares

  end

  def reveal_empty_neighbors
    neighbors = adjacent_squares
    neighbors.each do |neighbor|
      # reveal this neighbor
      move_args = ["r", neighbor]

      new_move = Move.new(move_args, board, dimension)
    end
  end

  def flag
    row, col = move_coords
    if board_arr[row][col] == "*"
      board_arr[row][col] = "F"
    elsif board_arr[row][col] == "F"
      board_arr[row][col] = "*"
    end
  end

end