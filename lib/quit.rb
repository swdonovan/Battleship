require 'pry'

module Quit

	def internal_quit(final_time, user_shot_count, comp_shot_count)
		print "Thank you for playing. Your game took #{final_time}. You took #{user_shot_count} shots at your oppenent. Your opponent shot at you #{comp_shot_count} times."
		exit!
	end

	def initialize_quit
		exit!
	end
end
