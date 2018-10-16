require './Player'
require './Case'
require './Board.rb'

class Game
	private
		attr_accessor :scoreboard, :players, :board, :is_over, :victory_positions, :turn_count

		def initialize()
			@turn_count = 0
			@players = []
			@players << Player.new("alex", 0, "x")
			@players << Player.new("michel", 0, "o")

			@scoreboard = {}
			@players.each do | player |
				@scoreboard[player.get_name] = player.get_score
			end

			@board = Board.new(@players)
			@board.build_map
			@is_over = false

			@victory_positions = []
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

		def check_if_player_win
			result = false
			map = get_board.get_map
			@victory_positions.each do | a, b, c |
				# puts "la case #{map[a].get_x}, #{map[a].get_y} contient #{map[a].get_content}"
					# return false 
				if @turn_count > 0
					if (map[a].get_content != "-" || map[b].get_content != "-" || map[c].get_content != "-")
						# puts (map[a].get_content == map[b].get_content && map[a].get_content == map[c].get_content && map[b].get_content ==  map[c].get_content)
						if (map[a].get_content == map[b].get_content && map[a].get_content == map[c].get_content && map[b].get_content ==  map[c].get_content)
							puts "Victory"
							result= true
						end
					end
				end
			end

			return result
		end

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
end