require './Player'
require './Case'
require './Board.rb'
require './Game.rb'
require 'pry'

# Couple of methods to start the game and print "Hello message".
# Only used for more visibility.

def print_home_message
	system "clear" or system "cls"
	puts "Welcome in my the Tic-Tac-Toe Game."
	puts "Lets get started !"
	puts "Ready ? y / n"
end

def main
	continue = true
	while continue
		print_home_message
		if gets.chomp == "y"
			game = Game.new
			game.run
		else
			system "clear" or system "cls"
			continue = false
			puts "See you later for new amazing games ;)"
		end
	end
end

main