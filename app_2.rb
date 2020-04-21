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
user = HumanPlayer.new(player_name)
player1 = Player.new("Josiane") 
player2 = Player.new("José") 
ennemies = [player1,player2]

while (player1.life_points > 0 || player2.life_points > 0) && user.life_points > 0
  puts "Quelle action veux-tu effectuer ?"
  puts "   a - chercher une meilleure arme"
  puts "   b - chercher un healthpack"
  puts ""
  puts "Attaquer un ennemi en vue :"
    if player1.life_points > 0
      puts "   0 - #{player1.show_state}"
    else
      puts "   #{player1.name} est mort"
    end
    if player2.life_points > 0
      puts "   1 - #{player2.show_state}"
    else
      puts "   #{player2.name} est mort"
    end

  puts ""

  user_choice = gets.chomp
  if user_choice == "a"
      puts ""
      user.search_weapon
    elsif user_choice == "b"
      puts ""
      user.search_health_pack
    elsif user_choice == "0"
      puts ""
      user.attacks(player1)
    elsif user_choice == "1"
      puts ""
      user.attacks(player2)
    else
      puts ""
      puts "Je n'ai pas compris ton choix, choisis entre a, b, 0 ou 1"
      user_choice = gets.chomp
  end

  puts ""
  ennemies.each do |ennemy|
    if ennemy.life_points > 0
      puts "Les ennemis attaquent !"
      ennemy.attacks(user)
      puts ""
    end
  end
end

puts ""

puts "La partie est finie."

if user.life_points > 0
  puts "Bravo, tu les as écrasés !"
  else
    puts "You loooooooose !"
end


