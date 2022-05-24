# frozen_string_literal: true

# class Board
class Board
  def initialize
    self.board = []
  end

  attr_accessor :board

  def build_game_board
    row = 1

    while row <= 10
      column = 1

      while column <= 10
        board.push({ row: row, column: column, status: '.' })
        column += 1
      end

      row += 1
    end
  end
end
