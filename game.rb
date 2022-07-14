require_relative 'board'
require_relative 'player'

class Game
  attr_reader :player1, :player2, :game_board
  attr_accessor :current_player

  def initialize
    @game_board = Board.new
    @player1 = Player.new('X')
    @player2 = Player.new('O')
    @current_player = player1
  end

  def play
    puts 'Player 1: X vs Player 2: O'
    puts "\n"
    game_board.print_board
    play_turns
  end

  def play_turns
    until game_over?
      puts "Player #{current_player.marker}'s turn"
      puts 'Please select one of the avilable numbers'
      player_selection = gets.chomp.to_i
      game_board.submit_move(player_selection, current_player.marker)
      change_turn
    end
  end

  private

  def change_turn
    @current_player = if current_player == player1
                       player2
                     else
                       player1
                     end
  end

  def game_over?
    if game_board.tie?
      puts "it's a tie! nobody wins."
      return true
    elsif game_board.winner?
      change_turn
      puts "player #{@current_player.marker} wins!"
      return true
    end
    false
  end
end