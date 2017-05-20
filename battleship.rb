require './lib/play'
# require './lib/quit'
# require './lib/instructions'
require 'pry'



print "Welcome to BATTLESHIP"

puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"

# answer = gets.chomp
# binding.pry
# game = Battleship.new.play if answer == "p" || "play"


class Battleship


		# quit = Quit.new  if arg == "q" || "quit"
		# instruct = Instructions.new if arg == "i" || "instructions"
	def play
		play = Play.new.start
	end


end
