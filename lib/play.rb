require_relative '../lib/board_graphic.rb'
require_relative '../lib/computer_ship'
require_relative '../lib/player_ship_placement'
require_relative '../lib/shot_sequence'
require_relative '../lib/quit'
require 'pry'
class Play
	include Quit

	def start
		board = BoardGraphic.new.display
		p board
		cpu_ship_placement
		player_ship_placement
		print_board
		fire_away
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
		printer.print_it(@user_ship.shiplib.shiplib, "P")
	end

  	def fire_away
		fire = ShotSequence.new(@user_ship.shiplib.shiplib, @comp_ship.shiplib.shiplib)
		fire.shoot
	end


end
