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
          self.board.push({row: "#{row}".to_i, column: "#{column}".to_i, status: 'X'})
          column += 1
        end

      row += 1
    end
  end
end

game_board = Board.new
game_board.build_game_board
p game_board