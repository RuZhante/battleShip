# frozen_string_literal: true

HIDDEN_BOARD = Array.new(10) { Array.new(10, '.') }
GUESS_BOARD = Array.new(10) { Array.new(10, '.') }

@letters_to_numbers = { 'A': 0, 'B': 1, 'C': 2, 'D': 3, 'E': 4, 'F': 5, 'G': 6, 'H': 7, 'I': 8, 'J': 9 }

def print_board(board)
  puts '     A B C D E F G H I J'
  puts '   +-+-+-+-+-+-+-+-+-+-+'
  row_number = 1
  board.each do |row|
    puts "#{row_number.to_s.rjust(2)} | #{row.join(' ')}"
    row_number += 1
  end
end

def create_ships(board)
  5.times do
    ship_row = rand(0..9)
    ship_column = rand(0..9)
    while board[ship_row][ship_column] == 'X'
      ship_row = rand(0..9)
      ship_column = rand(0..9)
    end
    board[ship_row][ship_column] = 'X'
  end
end

def ship_location
  print 'Please inter row position(1-10): '
  row = gets.chomp
  print 'Please inter column position(A-J): '
  column = gets.chomp
  if row == 'surrender' || column == 'surrender'
    puts 'What a shame…'
    'What a shame…'
  else
    { row: row.to_i - 1, column: @letters_to_numbers[column.capitalize.to_sym] }
  end
end

def count_hit_ships(board)
  count = 0
  board.each do |row|
    row.each { |column| count += 1 if column == 'X' }
  end
  count
end

create_ships(HIDDEN_BOARD)
# print_board(HIDDEN_BOARD)
# print_board(GUESS_BOARD)
turns = 10
puts 'Wellcome to BattleShip'
while turns.positive?
  puts
  print_board(GUESS_BOARD)
  crd = ship_location

  while crd == 'What a shame…'
    print_board(HIDDEN_BOARD)
    crd = ship_location
  end

  if GUESS_BOARD[crd[:row]][crd[:column]] == '-'
    puts 'You already guessed that'
    puts '=' * 80
  elsif HIDDEN_BOARD[crd[:row]][crd[:column]] == 'X'
    puts 'You have hit the battleShip'
    puts '=' * 80
    GUESS_BOARD[crd[:row]][crd[:column]] = 'X'
    turns -= 1
  else
    puts 'Sorry, you missed'
    puts '=' * 80
    GUESS_BOARD[crd[:row]][crd[:column]] = '-'
    turns -= 1
  end

  if count_hit_ships(GUESS_BOARD) == 5
    puts '=' * 80
    puts 'You have sunk all the battleShips'
    break
  end
  puts "You have #{turns} turns remaining"

  next unless turns.zero?

  puts '=' * 80
  puts 'GAME OVER'
  break
end
