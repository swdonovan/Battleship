require 'pry'

class PlayerShipPlacement

	def placement
		pt_boat_placement
	end

	def pt_boat_placement
		print "Please choose 2 adjacent coordinates to place your PT boat" + "\n"
			answer = gets.chomp
			binding.pry
			check(answer)
	end

	def check(answer)
		new_answer = answer.join.scan(/.{1}/)
		new_answer.each.with_index do |input, index|
			new_answer[index] = input.chr if input != (1..10)
		end
		insert_into_library
	end

	def insert_into_library
		
	end


end
