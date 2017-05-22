require 'pry'
require_relative 'ship_library'

class BoardGraphic
	attr_reader :display
							:print_it

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
		@sentence = ("  A B C D E F G H I J")
		y_axis(ship_library)
		@sentence
	end

	def y_axis(ship_library)
		ship_library.keys.each.with_index do |num, index|
			@sentence <<  "\n"
			binding.pry
			if ship_library[num].values.include? "P"
				space_index = ship_library[num].values.index "P"
				space_index = 1 if space_index == 0
				@sentence <<  "#{num}" + (" " * (space_index +6)) + "P"
			else
				@sentence << (+ "#{num}" + "\n")
			end
		end
	end

end



# test = BoardGraphic.new.first_output
