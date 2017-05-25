require './lib/play'
require_relative './lib/quit'
require_relative './lib/instruct'
# require './lib/instructions'
require 'pry'

class Battleship
	include Quit
	include Instruct

	def play
		play = Play.new.start
		p play
	end

	def quit
		initialize_quit
	end

	def instruct
		instructions
	end
end
puts "Welcome to BATTLESHIP"

puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
answer = gets.chomp

if answer.downcase == "p" || answer.downcase == "play"
	@game = Battleship.new.play
elsif
	answer.downcase == "q" || answer.downcase == "quit"
	@game = Battleship.new.quit
elsif
	answer.downcase == 'i' || answer.downcase == "instructions"
	@game = Battleship.new.instruct
end




# binding.pry
#
