require_relative '../lib/board_graphic.rb'
require_relative '../lib/computer_ship'
require_relative '../lib/player_ship_placement'
require 'pry'
class Play

	def start
		board = BoardGraphic.new.display
		print board
		cpu_ship_placement
		player_ship_placement
		print_board
	end

	def cpu_ship_placement
		@comp_ship = ComputerShip.new
		@comp_ship.placement
	end

	def player_ship_placement
		@user_ship = PlayerShipPlacement.new
		@user_ship.placement
	end

	def print_board
		printer = BoardGraphic.new
		printer.print_it(@user_ship.shiplib.shiplib)
		printer
	end
end
