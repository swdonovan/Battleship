require_relative '../lib/ship_library'
require_relative '../lib/board_graphic.rb'
require 'pry'

class PlayerShipPlacement
	attr_reader :shiplib

	def initialize
		@shiplib = ShipLibrary.new
	end

	def placement
		pt_boat_placement
		clear
		print_board
		submarine_placement
		clear
		print_board
		destroyer_placement
		clear
		print_board
		battleship_placement
		clear
		print_board
		air_craft_carrier_placement
	end

	def pt_boat_placement
		@new_answer = []
		print "Please choose a starting coordinates to place your PT boat  Ex: A1" + "\n"
			answer = gets.chomp
			char_to_num(answer)
			check_input("pt")
			generate_options_letters(1)
			options_display
			choose_end_coord("pt")
			char_to_num(@end_answer)
			check_input("pt")
			fill_coord_gap(1)
			end_answer_nil
			insert_into_library("pt")
	end

	def submarine_placement
		@new_answer = []
		print "Please choose a starting coordinates to place your Submarine at" + "\n"
			answer = gets.chomp
			char_to_num(answer)
			check_input("sub")
			generate_options_letters(2)
			options_display
			choose_end_coord("sub")
			char_to_num(@end_answer)
			check_input("sub")
			fill_coord_gap(2)
			end_answer_nil
			insert_into_library("sub")
	end

	def battleship_placement
		@new_answer = []
		print "Please choose a starting coordinates to place your Battleship at" + "\n"
			answer = gets.chomp
			char_to_num(answer)
			check_input("bs")
			generate_options_letters(3)
			options_display
			choose_end_coord("sub")
			char_to_num(@end_answer)
			check_input("bs")
			fill_coord_gap(3)
			end_answer_nil
			insert_into_library("bs")
	end

	def destroyer_placement
		@new_answer = []
		print "Please choose a starting coordinates to place your Destroyer boat  Ex: A1" + "\n"
			answer = gets.chomp
			char_to_num(answer)
			check_input("destroyer")
			generate_options_letters(2)
			options_display
			choose_end_coord("destroyer")
			char_to_num(@end_answer)
			check_input("destroyer")
			fill_coord_gap(2)
			end_answer_nil
			insert_into_library("destroyer")
	end

	def air_craft_carrier_placement
		@new_answer = []
		print "Please choose a starting coordinates to place your AC boat  Ex: A1" + "\n"
			answer = gets.chomp
			char_to_num(answer)
			check_input("ac")
			generate_options_letters(4)
			options_display
			choose_end_coord("ac")
			char_to_num(@end_answer)
			check_input("ac")
			fill_coord_gap(4)
			end_answer_nil
			insert_into_library("ac")
	end

	def char_to_num(answer)
		answer = answer.split.join.scan(/.{1}/)
		@new_answer << answer[0].downcase.ord; answer.shift
		@new_answer << answer[0].to_i if answer.length < 2
		@new_answer << answer.join.to_i if answer.length == 2
		end_answer_convert if @end_answer != nil
	end

	def check_input(boat_id)
		@new_answer.each do |char|
			if [*97..106].include?char
				nil
			elsif [*1..10].include?char
				nil
			else
				puts "You input wrong coordinates, please try again!"
				boat_recurse(boat_id)
			end
		end
	end

	def boat_recurse(boat_id)
		pt_boat_placement if boat_id == "pt"
		submarine_placement if boat_id == "sub"
		battleship_placement if boat_id == "bs"
		destroyer_placement if boat_id == "destroyer"
		carrier_placement if boat_id == "ac"
	end

	def print_board
		printer = BoardGraphic.new
		printer.print_it(@shiplib.shiplib, "P")
	end

	def insert_into_library(boat_id)
		until @new_answer.length == 0
			librarian_check(boat_id)
			@shiplib.insert(new_answer_index(1).to_i, new_answer_index(0), "P")
			@new_answer.shift(2)
		end
	end

	def librarian_check(boat_id)
		if @shiplib.shiplib[1][0] == "P"
			boat_recurse(boat_id)
		end
	end

	def generate_options_letters(distance)
		@options = []
		if new_answer_zero_equal_letter_max_min?("max")
			@options << (new_answer_index(0) - distance) << new_answer_index(1)
		elsif new_answer_zero_equal_letter_max_min?("min")
			@options << (new_answer_index(0) + distance) << new_answer_index(1)
		else
			four_directions(distance)
		end
		generate_same_letter_different_numbs(distance)
	end

	def four_directions(distance)
		if (new_answer_index(0) - 97) >= distance
			@options << (new_answer_index(0) - distance) << new_answer_index(1)
		end
		if (106 - new_answer_index(0)) >= distance
				@options << (new_answer_index(0) + distance) << new_answer_index(1)
		end
	end

	def generate_same_letter_different_numbs(distance)
		if new_answer_num_max_difference?(distance)
			vals_to_options(distance, "add")
		end
		if new_answer_num_min_difference?(distance)
			vals_to_options(distance, "subtract")
		end
	end

	def options_display
		@options.each.with_index do |val, index|
			@options[index] = val.chr if val >= 97
		end
			display_form
	end

	def display_form
		display = []
		counter = 0
		until counter == @options.length
			display << @options[counter..(counter + 1)].join
			counter += 2
		end
		@options = display
	end

	def choose_end_coord(boat_id)
		puts "Please choose the end coordinate for your boat #{@options}"
		@end_answer = gets.chomp
		librarian_check(boat_id)
	end

	def fill_coord_gap(length)
		if length >= 2
			if coordinates_not_equal?
				difference = answers_letter_difference
				fill_letter_gap(difference)
			elsif answer_equal?
				difference = answers_number_difference
				fill_num_gap(difference)
			end
		end
	end

	def fill_letter_gap(difference)
		counter = 1
		until counter == difference
			if new_answer_greater_than_end?(0)
				@new_answer << (new_answer_index(0) - counter) << new_answer_index(1)
				counter += 1
			else
				@new_answer << (new_answer_index(0) + counter) << new_answer_index(1)
				counter += 1
			end
		end
	end

	def fill_num_gap(difference)
		counter = 1
		until counter == difference
			if new_answer_greater_than_end?(1)
				@new_answer << new_answer_index(0) << (new_answer_index(1) - counter)
				counter += 1
			else
				@new_answer << new_answer_index(0) << (new_answer_index(1) + counter)
				counter += 1
			end
		end
	end

	def end_answer_convert
		answer = []
		@end_answer = @end_answer.split.join.scan(/.{1}/)
		@end_answer[0] = @end_answer[0].downcase.ord
		answer << @end_answer.shift
		answer << @end_answer[0].to_i if @end_answer.length < 2
		answer << @end_answer.join.to_i if @end_answer.length == 2
		@end_answer = []
		@end_answer << answer[0] << answer[1]
	end

	def end_answer_index(index)
		@end_answer[index]
	end

	def new_answer_less_than_end?(index)
		new_answer_index(index) < end_answer_index(index)
	end

	def new_answer_greater_than_end?(index)
		new_answer_index(index) > end_answer_index(index)
	end

	def new_answer_index(index)
		@new_answer[index]
	end

	def new_answer_zero_equal_letter_max_min?(max_min)
		new_answer_index(0) == 106 if max_min == "max"
		new_answer_index(0) == 97 if max_min == "min"
	end

	def answers_number_difference
		difference = new_answer_index(1) - end_answer_index(1).to_i if new_answer_greater_than_end?(1)
		difference = end_answer_index(1).to_i - new_answer_index(1) if new_answer_less_than_end?(1)
	end

	def answers_letter_difference
	 	if new_answer_less_than_end?(0)
			difference = end_answer_index(0).ord - new_answer_index(0)
		elsif new_answer_greater_than_end?(0)
			difference = new_answer_index(0) - end_answer_index(0).ord
		end
	end

	def coordinates_not_equal?
		end_answer_index(0).ord != new_answer_index(0)
	end

	def answer_equal?
		end_answer_index(0).ord == new_answer_index(0)
	end

	def new_answer_num_min_difference?(distance)
		(new_answer_index(1) - 1) >= distance
	end

	def new_answer_num_max_difference?(distance)
		(10 - new_answer_index(1)) >= distance
	end

	def vals_to_options(distance, math_method)
		@options << new_answer_index(0) << (new_answer_index(1) - distance) if math_method == "subtract"
		@options << new_answer_index(0) << (new_answer_index(1) + distance) if math_method == "add"
	end

	def end_answer_nil
		@end_answer = nil
	end

	def clear
		puts `clear`
	end

end
