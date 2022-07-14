require_relative 'game.rb'

continue_playing = 'y'
until continue_playing == 'n'
  my_game = Game.new
  my_game.play
  puts "Do you wish to play again? y/n"
  continue_playing = gets.chomp
  until continue_playing == 'n' || continue_playing == 'y'
    puts "please enter y/n"
    continue_playing = gets.chomp
  end
end