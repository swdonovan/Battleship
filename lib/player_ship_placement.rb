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
		print "Please choose a coordinates to place your PT boat" + "\n"
			answer = gets.chomp
			char_to_num(answer)
			check_input("pt")
			insert_into_library
	end

	def submarine_placement
		print "Please choose 3 adjacent coordinates to place your Submarine at" + "\n"
			answer = gets.chomp
			char_to_num(answer)
			check_input("sub")
			insert_into_library
	end

	def battleship_placement
		print "Please choose 4 adjacent coordinates to place your Submarine at" + "\n"
			answer = gets.chomp
			char_to_num(answer)
			check_input("bs")
			# generate_options(3)
			insert_into_library
	end

	def char_to_num(answer)
		@new_answer = []
		binding.pry
		n_answer = answer.split.join.scan(/.{1}/)
		@new_answer << n_answer[0].downcase.ord; n_answer.shift
		@new_answer << n_answer[0].to_i if n_answer.length < 2
		@new_answer << n_answer.join.to_i if n_answer.length == 2
	end

	def check_input(boat_id)
		@new_answer.each do |char|
			binding.pry
			if [*97..106].include?char
				nil
			elsif [*1..10].include?char
				nil
			else
				puts "You input wrong coordinates, please try again!"
				pt_boat_placement if boat_id == "pt"
				submarine_placement if boat_id == "sub"
				battleship_placement if boat_id == "bs"
				destroyer_placement if boat_id == "destroyer"
				carrier_placement if boat_id == "ac"
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








# def generate_options(peg_num)
# 	@player_options = []
# 	options = []
# 	if @new_answer[0] != 97 || @new_answer[0] != 106
# 		options << (@new_answer[0] + peg_num + @new_answer[1]) << (@new_answer[0] - peg_num + @new_answer[1])
# 		option_check(options)
# 		generate_num(options)
# end
#
# def option_check(option)
# 		option.map do |val|
# 			until val <= 97 || val <= 1
# 				val = val + (97 - val) if val > 80
# 				val = val + ()
# 			elsif val >= 106
# 				val = val - (val - 106)
# 			end
#
# end
#
# def generate_num(options)
#
#
# end
# def row_ten_convert
# 	@new_answer.map.with_index do |coords, index|
# 		prev_coord = @new_answer[index-1]
# 		next_coord = @new_answer[index+1]
# 		if index % 2 == 0 && coords.integer? == true
