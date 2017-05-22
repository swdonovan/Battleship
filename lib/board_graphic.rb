require 'pry'
require_relative 'ship_library'

class BoardGraphic
	attr_reader :display,
							:print_it,
							:sentence

	# def initialize(ship_library)
	#
	# end

	def display
		print first_output
	end

	def first_output
		" A B C D E F G H I J" + "\n" + "1" + "\n" + "2" + "\n" + "3" + "\n" +
		"4" + "\n" + "5" + "\n" + "6" + "\n" + "7" + "\n" + "8 " + "\n" +
		"9" + "\n" + "10" + "\n"
	end

	def print_it(ship_library)
		@sentence = (" A B C D E F G H I J")
		y_axis(ship_library)
		print @sentence
	end

	def y_axis(ship_library)
		ship_library.keys.each do |num|
			@sentence <<  "\n"
			if ship_library[num].values.include? "P"
				multiple_x_vals(ship_library, num)
			else
				@sentence << ("#{num}")
			end
		end
	end

	def multiple_x_vals(ship_library, num)
		@last_index = nil
		ship_library[num].values.each.with_index do |vals, index|
			if vals == "P"
				x_placement(index, num)
			end
		end
	end


	def x_placement(index, num)
		space_index
		spaces = @spaces[index - @last_index] if @last_index != nil
		spaces = @spaces[0] if @last_index == nil
		if @last_index == nil && index == 0
			@sentence <<  "#{num}" + (" " * spaces) + "P"
		elsif @last_index == nil && index != 0
			@sentence <<  "#{num}" + (" " * (index * 2)) + "P"
		else
			@sentence <<  (" " * spaces) + "P"
		end
		@last_index = index
	end

	def space_index
		@spaces = {0 => 0, 1 => 1, 2 => 3, 3 => 5, 4 => 7, 5 => 9,
							 6 => 11, 7 => 13, 8 => 15, 9 => 17}
	end

end




# test = BoardGraphic.new.first_output
