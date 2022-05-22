class Ship

  attr_accessor :get_random_coordinates

  def self.build_ship(board, count_ship, count_palub)
    coordinates = get_random_coordinates
    puts coordinates

  end

  def self.get_random_coordinates
    row = rand(1..10)
    column = rand(1..10)
    coordinates = {row: row, column: column}
    return coordinates
  end

  def self.is_available_coordinates?(board, coordinates)
    result = board.find { |item|  item.include?(coordinates)}
  end

  private_class_method :get_random_coordinates ,:is_available_coordinates?

end
