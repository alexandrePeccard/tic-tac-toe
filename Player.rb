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
			# puts "Select the case you want to play."
			puts "Choose a column"
			line_number = Integer(gets.chomp)
			puts "Choose a line"
			column_number = Integer(gets.chomp)
			# puts "Ok you play #{column_number}#{line_number}"

			return Case.new(column_number, line_number, get_symbol)
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
end