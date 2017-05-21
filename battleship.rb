require './lib/play'
# require './lib/quit'
# require './lib/instructions'
require 'pry'

class Battleship

	def answer(answer)
		play if answer == "p" || answer == "play"
	end
		# quit = Quit.new  if arg == "q" || "quit"
		# instruct = Instructions.new if arg == "i" || "instructions"
	def play
		play = Play.new.start
	end


end

puts "Welcome to BATTLESHIP"

puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
# binding.pry
answer = gets.chomp
game = Battleship.new.answer(answer)
