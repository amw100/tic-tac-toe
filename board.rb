class Board
  attr_accessor :game_board

  def initialize
    @game_board = Array(1..9)
  end

  def print_board
    puts '     |     |      '
    puts "  #{@game_board[0]}  |  #{game_board[1]}  |  #{game_board[2]}"
    puts '_____|_____|_____ '
    puts '     |     |      '
    puts "  #{@game_board[3]}  |  #{game_board[4]}  |  #{game_board[5]}"
    puts '_____|_____|_____ '
    puts '     |     |      '
    puts "  #{@game_board[6]}  |  #{game_board[7]}  |  #{game_board[8]}"
    puts '     |     |      '
  end

  def submit_move(placement, player)
    if valid_move?(placement)
      game_board[placement - 1] = player # array starts from 0 but board starts from 1
    else
      puts 'Invalid move! please select a different spot'
      submit_move(gets.chomp.to_i, player)
    end
    print_board
  end

  def winner?
    # check rows
    3.times do |i|
      return true if game_board[i * 3] == game_board[i * 3 + 1] && game_board[i * 3] == game_board[i * 3 + 2]
    end
    # check columns
    3.times do |i|
      return true if game_board[i] == game_board[i + 3] && game_board[i] == game_board[i + 6]
    end
    # check diagonals
    return true if game_board[0] == game_board[4] && game_board[4] == game_board[8]
    return true if game_board[2] == game_board[4] && game_board[4] == game_board[6]

    # base case
    false
  end

  def tie?
    game_board.each do |element|
      next if element.is_a?(String)
      return false if element.between?(1, 9)
    end
    true
  end

  private

  def valid_move?(placement)
    return false if game_board[placement - 1] == 'X' || game_board[placement - 1] == 'O' || !placement.between?(1, 9)

    true
  end
end
