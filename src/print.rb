# frozen_string_literal: true

# class Print
class Print
  def self.get_string_board(board)
    string_board = ''
    board.each do |item|
      string_board += case item[:column]
                      when 10
                        " #{item[:status]}\n"
                      when 1
                        "#{item[:row].to_s.rjust(2)}| #{item[:status]}"
                      else
                        " #{item[:status]}"
                      end
    end
    puts string_board
  end

  def self.print_game_board(board)
    puts '    A B C D E F G H I J'
    puts '   +-+-+-+-+-+-+-+-+-+-+'
    get_string_board(board)
  end

  private_class_method :get_string_board
end
