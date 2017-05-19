require './lib/play'
require './lib/quit'
require './lib/instructions'



print "Welcome to BATTLESHIP"

puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"

answer = gets.chomp
answer = Battleship.new(arg)

class Battleship

	def initialize(arg)
		play = play.new  if arg == "p" || "play"
		quit = quit.new  if arg == "q" || "quit"
		instruct = instructions.new if arg == "i" || "instructions"
		runner
	end

	def runner
		
	end

end
