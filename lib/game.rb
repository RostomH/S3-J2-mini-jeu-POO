require 'pry'

class Game 
  attr_accessor :human_player, :enemies

  def initialize(name)
    @human_player = HumanPlayer.new(name)
    enemy1 = Player.new("Joker")
    enemy2 = Player.new("Loki")
    enemy3 = Player.new("Thanos")
    enemy4 = Player.new("Ultron")
    @enemies = [enemy1, enemy2, enemy3, enemy4]
  end

  def kill_player(enemy)
    @enemies.delete("#{enemy}")
  end

  def is_still_ongoing?
    if @human_player.life_points > 0 && @enemies.length > 0
      return true
    else
      return false
    end
  end

  def show_players
    @human_player.show_state
    puts ""
    puts "Il reste #{@enemies.length} ennemies à éliminier !"
  end

  def menu
    puts "Quelle action veux-tu effectuer ?"
    puts "   a - chercher une meilleure arme"
    puts "   b - chercher un healthpack"
    puts ""
    puts "Attaquer un ennemi en vue :"
      @enemies.each do |enemy|
        if enemy.life_points > 0
          puts "   #{enemies.index(enemy)} - #{enemy.show_state}"
        end
      end
  end

  def menu_choice(user_choice)
      user_choice = gets.chomp
    if user_choice == "a"
        puts ""
        @human_player.search_weapon
      elsif user_choice == "b"
        puts ""
        @human_player.search_health_pack
      elsif user_choice == "0"
        puts ""
        @human_player.attacks(@enemies[0])
        if @enemies[0].life_points <= 0
          kill_player(@enemies[0]) end
      elsif user_choice == "1"
        puts ""
        @human_player.attacks(@enemies[1])
        if @enemies[1].life_points <= 0
          kill_player(@enemies[1]) end
      elsif user_choice == "2"
        puts ""
        @human_player.attacks(@enemies[2])
        if @enemies[2].life_points <= 0
          kill_player(@enemies[2]) end
      elsif user_choice == "3"
        puts ""
        @human_player.attacks(@enemies[3])
        if @enemies[3].life_points <= 0
          kill_player(@enemies[3]) end
      else
        puts ""
        puts "Je n'ai pas compris ton choix, réessaye."
        user_choice = gets.chomp
    end

    def enemies_attack
      @enemies.each do |enemy|
        enemy.attacks(human_player)
      end
    end

    
    def end_of_game
      puts "La bataille est terminée."
      if @human_player.life_points > 0
        puts "Bien joué, tu les as terrassés !"
      else
        puts "You loose..."
      end
    end

  end


end

