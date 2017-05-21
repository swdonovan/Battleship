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
	end

	def cpu_ship_placement
		comp_ship = ComputerShip.new.placement
	end

	def player_ship_placement
		user_ship = PlayerShipPlacement.new.placement
	end
end
