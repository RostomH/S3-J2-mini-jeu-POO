require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

# Début du jeu

puts "-----" * 10
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !        |"
puts "|Le but du jeu est d'être le dernier survivant !  |"
puts "-----" * 10

puts "Quel est ton prénom ?"
player_name = gets.chomp
my_game = Game.new(player_name)

while my_game.is_still_ongoing? == true
  puts ""
  my_game.menu
  puts ""
  user_choice = gets.chomp
  puts ""
  my_game.menu_choice(user_choice)
  puts ""
  my_game.enemies_attack
  puts ""
  my_game.show_players
end

puts ""
my_game.end_of_game


