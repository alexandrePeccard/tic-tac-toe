# Class which represents the game board.
# Contains a map of cases, some methods to build,
# update and print the board.
class Board
	private
		attr_accessor :map, :players, :cases

		def initialize(players)
			@map = {}
			@players = players
			@cases = []
		end

	public

		def	get_cases
			return @cases
		end

		def get_map
			return @map
		end

		def set_map(map)
			@map = map
		end

		def get_players
			return @players
		end

		def set_players(players)
			@players = players
		end

		# we build the map there
		# that means we create all the case object we need
		# and add them into the map hash
		def build_map
			for i in(0..2)
				for j in (0..2)
					newcase = Case.new(i, j, nil)
					get_cases << newcase
					map = get_map
					map[[i, j]] = newcase
					set_map(map)
				end
			end
		end

		def print_map
			line = ""
			for i in(0..2)
				line += "         |"
				for j in (0..2)
					line += "#{map[[i, j]].to_string}"
				end
				line += "|"
				line += "\n"
			end

			puts line
		end

		# This method update the board with the last move of one player.
		# params : Player, last move position
		def update(last_move_params)
			player = last_move_params[0]
			position = last_move_params[1]

			is_move_valid = false

			# si la case n'est pas déjà occupée par un autre joueur
			# on set le joueur courant comme owner de la case
			if get_map[position].get_owner == nil
				is_move_valid = true
				get_map[position].set_owner(player)
			else
				puts "This Case is already taken by another player !"
				puts "Try again !"
			end

			return self, is_move_valid
		end
end