require_relative 'board.rb'
require_relative 'print.rb'

# create the game_board
game_board = Board.new
game_board.build_game_board

# print the game board
Print.print_game_board(game_board.board)