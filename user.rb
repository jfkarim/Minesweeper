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
    puts "Would you like to reveal or flag this turn? (Enter r or f)"
    answer = gets.chomp.downcase[0]

    coords = get_coords
    [answer, coords]

      # error handling needed
  end

  def get_coords
    puts "Please enter coordinates separated by comma."

    gets.chomp.split(",")
  end

end