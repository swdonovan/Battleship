require 'pry'

module Quit

	def internal_quit
		Battlship.exit!
	end

	def initialize_quit
		exit!
	end
end
