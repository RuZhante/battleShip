# frozen_string_literal: true

# class Ship
class Ship
  def self.build_ship(board, _count_ship, _count_palub)
    coordinates = get_random_coordinates(board)

    p coordinates
  end

  def self.get_random_coordinates(board)
    board.sample
  end

  def self.available_coordinates?(board, coordinates); end

  def self.ship_building_direction
    direction = %w[left right up down]
    direction.sample
  end

  private_class_method :get_random_coordinates, :is_available_coordinates?, :ship_building_direction
end
