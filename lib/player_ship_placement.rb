require_relative '../lib/ship_library'
require 'pry'

class PlayerShipPlacement
	attr_reader :shiplib
	
	def initialize
		@shiplib = ShipLibrary.new
	end

	def placement
		pt_boat_placement
		submarine_placement
	end

	def pt_boat_placement
		print "Please choose 2 adjacent coordinates to place your PT boat" + "\n"
			answer = gets.chomp
			check(answer)
			insert_into_library
	end

	def submarine_placement
		print "Please choose 3 adjacent coordinates to place your Submarine at" + "\n"
			answer = gets.chomp
			check(answer)
			insert_into_library
	end

	def battleship_placement
		print "Please choose 4 adjacent coordinates to place your Submarine at" + "\n"
			answer = gets.chomp
			check(answer)
			insert_into_library
	end

	def check(answer)
		num_check = *(1..10)
		@new_answer = answer.split.join.scan(/.{1}/)
		@new_answer.each.with_index do |input, index|
			if index % 2 == 0
				@new_answer[index] = input.downcase.ord
			end
		end
	end

	def insert_into_library
		until @new_answer.length == 0
			@shiplib.insert(@new_answer[1].to_i, @new_answer[0], "P")
			@new_answer.shift(2)
		end
	end



end
