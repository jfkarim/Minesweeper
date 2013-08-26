class Board
  attr_accessor :board

  def initialize(dimension)
    @board = []
    dimension.times { @board << Array.new(dimension) }
  end
end