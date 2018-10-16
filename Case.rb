# Class which represents a Case on the game board.
# Contains a couple of coordinate to find the case on the board,
# and some methods to know which player owns it.
class Case
	private
		attr_accessor :x, :y, :owner

		def initialize(x, y, owner)
			@x = x
			@y = y
			@owner = owner
		end

	public

		def get_x
			return @x
		end

		def get_y
			return @y
		end

		def get_owner
			return @owner
		end

		def set_owner(owner)
			@owner = owner
		end

		def to_string
			result = ""
			if @owner == nil
				result = "-"
			else 
				result = @owner.get_symbol
			end

			return result
		end
end