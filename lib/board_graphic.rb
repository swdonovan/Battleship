require 'pry'
require_relative 'ship_library'

class BoardGraphic
	attr_reader :display

	# def initialize
	# 	shiplib = ShipLibrary.new.shiplib
	# end

	def display
		print first_output
	end

	def first_output
		 " A B C D E F G H I J" + "\n" + "1" + "\n" + "2" + "\n" + "3" + "\n" +
						"4" + "\n" + "5" + "\n" + "6" + "\n" + "7" + "\n" + "8 " + "\n" +
						"9" + "\n" + "10" + "\n"
	end

	def form_sentence
		@sentence = " "
		x_axis
		y_axis
	end

	def x_axis
		top_row = [*97..106].join(',')
		top_row.each do |letter|
			@sentence << letter.chr + " "
		end
	end


	def y_axis
		shiplib.keys.each.with_index do |num, index|
			if shiplib[num].values.include? "X"
				space_index = shiplib[num].values.index "X"
					space_index = 0 if space_index == nil
				@sentence << + "\n" + num + " "
			end
		end
	end
end

test = BoardGraphic.new.first_output
