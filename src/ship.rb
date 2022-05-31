# frozen_string_literal: true

# class Ship
class Ship
  def self.build_ship(board, count_ship, count_palub)
    available_coordinates_board = Marshal.load(Marshal.dump(board))
    count_ship.times do
      count_palub.times do
        coordinates = get_random_coordinates(available_coordinates_board)
        set_palub(coordinates, board)
      end
    end

    puts('--->', board.size)
    puts('--->', available_coordinates_board.size)
  end

  def self.get_random_coordinates(available_coordinates_board)
    random_index = rand(0..(available_coordinates_board.size - 1))
    available_coordinates_board.delete_at(random_index)
  end

  def self.set_palub(coordinates, board)
    board.map do |i|
      i[:status] = 'H' if i[:row] == coordinates[:row] && i[:column] == coordinates[:column]
    end
  end

  def self.available_coordinates?(board, coordinates); end

  def self.ship_building_direction
    direction = %w[left right up down]
    direction.sample
  end

  private_class_method :get_random_coordinates, :available_coordinates?, :ship_building_direction
end
