# Class which represents a Player.
# Allow to select an area on the board to play
# and memorize the score.
class Player
	private
		attr_accessor :name, :score, :symbol

		def initialize(name, score, symbol)
			@name = name
			@score = score
			@symbol = symbol
		end

	public
		def play
			position = []
			puts "Choose a column"
			line_number = Integer(gets.chomp)
			puts "Choose a line"
			column_number = Integer(gets.chomp)

			return [self, [column_number, line_number]]
		end

		def get_name
			return @name
		end

		def get_score
			return @score
		end
		
		def get_symbol
			return @symbol
		end

		def increment_score
			@score += 1
		end
end