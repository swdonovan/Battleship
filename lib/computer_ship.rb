require_relative '../lib/ship_library'
require 'pry'

class ComputerShip
	attr_reader :shiplib

	def initialize
		@shiplib = ShipLibrary.new
	end

	def placement
		cpu_ship_placement(2)
		cpu_ship_placement(3)
		cpu_ship_placement(3)
		cpu_ship_placement(4)
		cpu_ship_placement(5)
	end

	def cpu_ship_placement(ship_size)
		ship = rand(97..106), rand(1..10)
		ship_length(ship[0], ship[1], ship_size)
		library_placement(ship_size)
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
		if @counter < 2
			two_peg_placement(start_lett)
		else
			three_plus_placement
		end
	end

	def two_peg_placement(start_lett)
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

	def three_plus_placement
		if @selection[0] == @selection[-2]
			@start_comb << @selection[0]
		elsif @selection[0] < @selection[-2]
			@start_comb << (@selection[-2] + 1) if @selection[-2] != 106
			@start_comb << (@selection[0] - 1) if @selection[-2] == 106
		elsif @selection[0] > @selection[-2]
			@start_comb << (@selection[-2] - 1) if @selection[-2] != 97
			@start_comb << (@selection[0] + 1) if @selection[-2] == 97
		end
	end

	def boat_numb(start_num)
		last_num = []
		if (start_num != 1 || start_num != 10) && @start_comb[0] == @selection[0]
			last_num << (start_num - 1) << (start_num + 1)
			@start_comb << last_num.sample
		elsif @start_comb[0] == @selection[0] && start_num == 1
			@start_comb << (start_num + 1)
		elsif @start_comb[0] == @selection[0] && start_num == 10
			@start_comb << (start_num - 1)
		else
			@start_comb << start_num
		end
		@selection << @start_comb.shift << @start_comb.shift
		@counter += 1
	end

	def library_placement(ship_size)
		check(ship_size)
		@selection.flatten!
		until @selection.length == 0
			@shiplib.insert(@selection[1], @selection[0], "c")
			@selection.shift(2)
		end
	end

	def check(ship_size)
		selections = []
		until @selection.length == 0
			if @shiplib.shiplib[@selection[1]][@selection[0]] == "c"
				cpu_ship_placement(ship_size)
			else
				selections << @selection.shift(2)
			end
		end
		@selection << selections.flatten
	end


end
