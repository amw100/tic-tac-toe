require_relative 'game'

continue_playing = 'y'
until continue_playing == 'n'
  my_game = Game.new
  my_game.play
  puts 'Do you wish to play again? y/n'
  continue_playing = gets.chomp
  until %w[n y].include?(continue_playing)
    puts 'please enter y/n'
    continue_playing = gets.chomp
  end
end
