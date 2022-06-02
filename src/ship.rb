# frozen_string_literal: true

# class Ship
class Ship
  def self.build_ship(board, count_ship, count_palub)
    available_coordinates_board = Marshal.load(Marshal.dump(board))
    count_ship.times do
      coordinates = get_random_coordinates(available_coordinates_board)
      find_coordinates = check_ship_contact(available_coordinates_board, coordinates)
      while find_coordinates.size < 4
        coordinates = get_random_coordinates(available_coordinates_board)
        find_coordinates = check_ship_contact(available_coordinates_board, coordinates)
      end
      build_coordinates = get_ship_building_direction(available_coordinates_board, coordinates, count_palub)
      while build_coordinates.size.zero?
        build_coordinates = get_ship_building_direction(available_coordinates_board, coordinates, count_palub)
      end
      set_palub(coordinates, board, build_coordinates)
    end
  end

  def self.get_random_coordinates(available_coordinates_board)
    random_index = rand(0..(available_coordinates_board.size - 1))
    available_coordinates_board.delete_at(random_index)
  end

  def self.check_ship_contact(available_coordinates_board, coordinates)
    available_coordinates_board & [{ row: coordinates[:row] + 1, column: coordinates[:column] - 1, status: '.' },
                                   { row: coordinates[:row] - 1, column: coordinates[:column] - 1,
                                     status: '.' },
                                   { row: coordinates[:row] + 1, column: coordinates[:column] + 1,
                                     status: '.' },
                                   { row: coordinates[:row] - 1, column: coordinates[:column] + 1,
                                     status: '.' }]
  end

  def self.get_ship_building_direction(available_coordinates_board, coordinates, count_palub)
    n = count_palub - 1
    available_coordinates_board & [{ row: coordinates[:row], column: coordinates[:column] - n,
                                     status: '.' },
                                   { row: coordinates[:row], column: coordinates[:column] + n,
                                     status: '.' },
                                   { row: coordinates[:row], column: coordinates[:column] - n,
                                     status: '.' },
                                   { row: coordinates[:row], column: coordinates[:column] - n,
                                     status: '.' }]
  end

  def self.set_palub(_coordinates, board, _build_coordinates)
    board.map do |i|
      puts i # todo
    end
  end

  private_class_method :get_random_coordinates
end
