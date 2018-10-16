require './Player'
require './Case'
require './Board.rb'
require './Game.rb'
require 'pry'

continue = true
while continue
	system "clear" or system "cls"
	puts "Welcome in my the Tic-Tac-Toe Game."
	puts "Lets get started !"
	puts "Ready ? y / n"

	if gets.chomp == "y"

		game = Game.new
		while game.get_is_over != true
			board = game.get_board
				
			game.get_players.each do | player |
				system "clear" or system "cls"
				board.print_map
				puts "\n"
				puts "C\'est au joueur #{player.get_name} de jouer !\n"

				#appel fonction play de l'objet joueur qui renvoie la case à laquelle il a joué
				newcase = player.play
				map = board.get_map

				# on remplace l'ancienne case par la nouvelle afin de modifieur le rendu visuel
				board.get_map[[newcase.get_x, newcase.get_y]].set_content(newcase.get_content)
				board.set_map(map)


				puts "\n"

				# on vérifie si le joueur remplie les conditions de victoire 
				game.set_is_over(is_game_over = game.check_if_player_win)
				game.set_turn_count
				
				# binding.pry
				# si le joueur remplie les conditions de victoire on interromp la partie
				if game.get_is_over
					# break
					return false
				end
			end
		end

	else
		system "clear" or system "cls"
		continue = false
		puts "See you later for new amazing games ;)"
	end
end