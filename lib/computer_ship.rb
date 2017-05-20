require 'pry'

class ComputerShip

	def placement
		@shiplib = ShipLibrary.new.shiplib
		cpu_ship_placement
	end

	def cpu_ship_placement
		ship_length(rand(97..106), rand(1..10), 2)
		library_placement
	end

	def selection(start_lett, start_num)
		@selection = []
		@selection << start_lett << start_num
		library_placement
	end

	def ship_length(start_lett, start_num, pegs)
		binding.pry
		selection(start_lett, start_num)
		@counter = 1
		@start_comb = []
		until @counter == pegs
			boat_lett(start_lett, start_num)
		end
	end

	def boat_lett(start_lett, start_num)
		if start_lett != 106 || 97
			@start_comb << start_lett -= 1 << start_lett << start_lett += 1
			@start_comb = rand[@start_comb[0]..@start_comb[1]]
			boat_numb(start_num)
		elsif start_lett == 97
			@start_comb << start << start_lett += 1
			@start_comb = rand[@start_comb[0]..@start_comb[1]]
			boat_num(start_num)
		elsif start_lett == 106
			@start_comb << start_lett -= 1 << start_lett
			@start_comb = rand[@start_comb[0]..@start_comb[1]]
			boat_num(start_num)
		end
	end

	def boat_num(start_num)
		last_num = []
		if @start_comb[0] == @selection[0]
			last_num << start_num -= 1 << start_num << start_num += 1
			@start_comb << rand[last_num[0]..last_num[1]]
			@counter += 1
		else
			@start_comb << start_num
			@counter += 1
		end
	end

	def library_placement
		@shiplib[@selection[1]][@selection[0]] << "C"
		@selection = []
	end

end
