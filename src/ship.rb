class Ship

  def self.build_ship(board, count_ship, count_palub)

        coordinates = get_random_coordinates(board)

        p coordinates






  end

  def self.get_random_coordinates(board)
    board.sample
  end

  def self.is_available_coordinates?(board, coordinates)
    # find_coordinates = board.find do |hash_coordinates|
    #   hash_coordinates[:row] == coordinates[:row] &&
    #   hash_coordinates[:column] == coordinates[:column]
    # end

    # if find_coordinates[:status] == '.'
    #   true
    # else
    #   false
    # end
  end

  def self.ship_building_direction
    direction = ['left', 'right', 'up', 'down']
    random_direction = direction.sample

  end

  private_class_method :get_random_coordinates ,:is_available_coordinates?, :ship_building_direction

end
