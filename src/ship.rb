class Ship

  def self.build_ship(board, count_ship, count_palub)
    coordinates = get_random_coordinates
    puts coordinates

    is_available_coordinates?(board, coordinates)

  end

  def self.get_random_coordinates
    row = rand(1..10)
    column = rand(1..10)
    coordinates = {row: row, column: column}
    return coordinates
  end

  def self.is_available_coordinates?(board, coordinates)
    result = nil
    board.each do |hash_coordinates|
      if hash_coordinates[:row] == coordinates[:row] &&
         hash_coordinates[:column] == coordinates[:column] &&
         hash_coordinates[:status] == 'X'
        result = true
      elsif
        result = false
      end
    end
    p result
  end

  private_class_method :get_random_coordinates ,:is_available_coordinates?

end
