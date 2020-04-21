require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("José")
player3 = HumanPlayer.new("Rostom")

while player1.life_points > 0 && player2.life_points > 0
puts " "
  puts "Voici l'état de chaque joueur :"
player1.show_state
player2.show_state 
puts " "
puts "Passons à la phase attaque :"
player1.attacks(player2)
break if player2.life_points <= 0
player2.attacks(player1)
end

puts ""
player3.search_health_pack
puts ""
player3.search_weapon
puts ""
player3.show_state
