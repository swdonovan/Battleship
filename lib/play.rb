class Play

	def initialization
		board = Board.new.init
	end

	def start
		cpu_ship_placement
	end
