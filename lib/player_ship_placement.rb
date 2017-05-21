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

	end


end
