require 'pry'

module Quit

	def internal_quit(final_time)
		print "Thank you for playing. Your game took #{final_time}. You took X amount of shots at your oppenent."
		Battlship.exit!
	end

	def initialize_quit
		exit!
	end
end
