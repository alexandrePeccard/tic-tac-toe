# require './Case.rb'
# require './Player.rb'

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

		def build_map
			for i in(0..2)
				for j in (0..2)
					newcase = Case.new(i, j, "-")
					get_cases << newcase
					get_map[[i, j]] = newcase
				end
			end
		end

		def print_map
			line = ""
			for i in(0..2)
				for j in (0..2)
					line += get_map[[i, j]].get_content
				end
				line += "\n"
			end
			puts line
		end
end