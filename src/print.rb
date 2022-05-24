require_relative './board.rb'

class Print

  def self.print_game_board(board)
    puts '    A B C D E F G H I J'
    puts '   +-+-+-+-+-+-+-+-+-+-+'

    string_board = ''

    board.each do |item|

      status = case item[:status]
      when Board::STATUSES[:empty], Board::STATUSES[:busy]
        "."
      end

      if item[:column] == 10
        string_board += " #{status}\n"
      elsif
        if item[:column] == 1
          string_board += "#{item[:row].to_s.rjust(2)}| #{status}"
        elsif
          string_board += " #{status}"
        end
      end

    end

    puts string_board
  end
end
