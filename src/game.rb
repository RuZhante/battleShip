# frozen_string_literal: true

require_relative 'board'
require_relative 'print'
require_relative 'ship'

# create the game_board
game_board = Board.new
game_board.build_game_board

# print the game board
Print.print_game_board(game_board.board)

# create ships
Ship.build_ship(game_board.board, 1, 4)

Print.print_game_board(game_board.board)
