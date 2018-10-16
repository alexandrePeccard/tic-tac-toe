require './Player'
require './Case'
require './Board.rb'

# Main class. Its contains a link to all another classes.
# Allow to run the game, manage victory conditions, menu etc..
class Game
	private
		attr_accessor :scoreboard, :players, :board, :is_over, :victory_positions, :turn_count

		def create_players
			puts "Choose the name of the player 1 !"
			player_one_name = gets.chomp

			puts "Choose the name of the player 2 !"
			player_two_name = gets.chomp

			@players << Player.new(player_one_name, 0, "x")
			@players << Player.new(player_two_name, 0, "o")
		end

		def initialize()
			@turn_count = 0
			@players = []

			create_players

			@scoreboard = {}
			@players.each do | player |
				@scoreboard[player.get_name] = player.get_score
			end

			@board = Board.new(@players)
			@board.build_map
			@is_over = false

			@victory_positions = [
				[
					#horizontal haut
					[0, 0], [0, 1], [0, 2]
				],
				[
					#horizontal milieu
					[1, 0], [1, 1], [1, 2]
				],
				[
					#horizontal bas
					[2, 0], [2, 1], [2, 2]
				],
				[
					#oblique gauche vers droite
					[0, 0], [1, 1], [2, 2]
				],
				[
					#oblique droite vers gauche
					[0, 2], [1, 1], [2, 0]
				],
				[
					#vertical gauche
					[0, 0], [1, 0], [2, 0]
				],
				[
					#vertical milieu
					[0, 1], [1, 1], [2, 1]
				],
				[
					#vertical droite
					[0, 2], [1, 2], [2, 2]
				]
			]
		end

	public
		def set_turn_count
			@turn_count +=1
		end

		def get_turn_count
			return @turn_count
		end

		def get_scoreboard
			return @scoreboard
		end

		def get_board
			return @board
		end

		def get_players
			return @players
		end

		def get_is_over
			return @is_over
		end

		def set_is_over(is_over)
			@is_over = is_over
		end

		def check_if_player_win(player)
			@board.print_map
			puts "\n"
			map = get_board.get_map

			@victory_positions.each do | a, b, c |

				if @turn_count > 0
					if (map[a].get_owner != nil || map[b].get_owner != nil || map[c].get_owner != nil)
						if (map[a].get_owner == map[b].get_owner && map[a].get_owner == map[c].get_owner && map[b].get_owner ==  map[c].get_owner)
							puts "Le joueur #{player.get_name} a gagné la partie !"
							puts "Victory"
							player.increment_score
							set_is_over(true)
						end
					end
				end
			end
		end

		def run
			while get_is_over != true

				get_players.each do | player |
					unless get_is_over then
						system "clear" or system "cls"
						get_board.print_map

						# This piece of code allows to check if there is available case to play. 
						still_available_cases = false
						get_board.get_cases.each do | current_case |
							still_available_cases = true if current_case.get_owner == nil
						end

						if still_available_cases
							puts "\n"
							puts "C\'est au joueur #{player.get_name} de jouer !\n"


							is_move_valid = false

							# appel fonction play de l'objet joueur qui renvoie la case à laquelle il a joué
							# on boucle pour que le joueur rejoue si son coup n'est pas valide
							while is_move_valid != true
								last_move_params = player.play
								@board, is_move_valid = get_board.update(last_move_params)
							end
							puts "\n"

							# on vérifie si le joueur remplie les conditions de victoire 
							check_if_player_win(player)
							set_turn_count
							else
							puts "None players have won and there are no more available case to play."
							puts "It is an equality ! Game is over !"
							set_is_over(true)
						end
					end
				end
			end
		end
end