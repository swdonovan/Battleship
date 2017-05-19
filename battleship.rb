require './lib/play'
require './lib/quit'
require './lib/instructions'



print "Welcome to BATTLESHIP"

puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"

answer = gets.chomp
game = Battleship.new(answer)

class Battleship

	def initialize(arg)
		play = play.new.start  if arg == "p" || "play"
		quit = quit.new  if arg == "q" || "quit"
		instruct = instructions.new if arg == "i" || "instructions"
		runner
	end


end
