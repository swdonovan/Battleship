require './lib/play'
# require './lib/quit'
# require './lib/instructions'
require 'pry'

class Battleship

	def play
		play = Play.new.start
		print play
	end
end
puts "Welcome to BATTLESHIP"

puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
answer = gets.chomp

if answer == "p" || answer == "play"
	binding.pry
	game = Battleship.new.play
else
	puts "thank you for not working"
end




# binding.pry
