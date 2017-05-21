require 'pry'

class ComputerShip
	attr_reader :ship_length,
							:boat_numb

	def placement
		@shiplib = ShipLibrary.new.shiplib
		cpu_ship_placement
	end

	def cpu_ship_placement
		ship = rand(97..106), rand(1..10)
		ship_length(ship[0], ship[1], 2)
		library_placement
	end

	def selection(start_lett, start_num)
		@selection = []
		@selection << start_lett << start_num
	end

	def ship_length(start_lett, start_num, pegs)
		selection(start_lett, start_num)
		@counter = 1
		@start_comb = []
		until @counter == pegs
			boat_lett(start_lett)
			boat_numb(start_num)
		end
	end

	def boat_lett(start_lett)
		if start_lett != 97 && start_lett != 106
			@start_comb << (start_lett - 1) << (start_lett) << (start_lett + 1)
			@start_comb = [@start_comb.sample]
		elsif start_lett == 97
			@start_comb << start_lett << (start_lett + 1)
			@start_comb = [@start_comb.sample]
		elsif start_lett == 106
			@start_comb << (start_lett - 1) << start_lett
			@start_comb = [@start_comb.sample]
		end
	end

	def boat_numb(start_num)
		last_num = []
		if @start_comb[0] == @selection[0]
			last_num << (start_num - 1) << (start_num + 1)
			@start_comb << last_num.sample
			@counter += 1
		else
			@start_comb << start_num
			@counter += 1
		end
		@selection << @start_comb.shift << @start_comb.shift
	end

	def library_placement
		until @selection.length == 0
			@shiplib[@selection[1]][@selection[0]] << "C"
			@selection.shift(2)
		end
	end

end
