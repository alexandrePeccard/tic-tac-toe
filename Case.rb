class Case
	private
		attr_accessor :x, :y, :content

		def initialize(x, y, content = '-')
			@x = x
			@y = y
			@content = content
		end

	public

		def get_x
			return @x
		end

		def get_y
			return @y
		end
		
		def get_content
			return @content
		end

		def set_content(content)
			@content = content
		end

		def to_string
			result = ""
			if @content.class == string
				result = "-"
			elsif @content.class == Player
				result = @content.symbol
			end

			return result
		end
end