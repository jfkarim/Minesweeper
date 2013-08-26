class User

  attr_accessor :name

  def initialize
    self.name = get_name
  end

  def get_name
    puts "What is your name?"

    gets.chomp.capitalize
  end

  def move
    answer = ""

    loop do
      puts "Would you like to reveal or flag this turn? (Enter r or f)"
      answer = gets.chomp.downcase[0]
      break if answer == "r" || answer == "f"
    end

    coords = get_coords
    [answer, coords]

  end

  def get_coords
    coords = []
    loop do
      puts "Please enter coordinates separated by comma."

      coords = gets.chomp.split(",")
      return coords.map! { |el| el.to_i } unless coords.length != 2
      puts "Invalid move"
    end

    coords
  end

end