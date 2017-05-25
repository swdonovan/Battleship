require 'pry'
require_relative 'quit'

class ShotSequence
	include Quit

	def initialize(user_ship_library, computer_ship_library)
		@user_library = user_ship_library
		@comp_library = computer_ship_library
		@start_time = Time.now
		@shot_count_user = 0
		@shot_count_comp = 0
	end

	def board
		board = BoardGraphic.new
	end

	def shoot
		board
		@counter = 0
		clear
		board.print_it(@comp_library, "X")
		player_shoot if @counter == 0
		@shot_count_user += 1
		comp_shoot if @counter == 1
		@shot_count_comp += 1
		shoot
	end

	def player_shoot(library = @comp_library)
		p_shots = []
		print "\n" + "Please enter coordinates to fire at" + "\n"
		p_shots = gets.chomp.downcase.split(//,2)
		p_shots[0] = p_shots[0].ord
		if [*97..106].include?(p_shots[0]) && [*1..10].include?(p_shots[1].to_i)
			insert(p_shots, library)
		else
			player_shoot
		end
		win_check(library, "c")
		@counter += 1
	end

	def comp_shoot(library = @user_library)
		shots = [rand(97..106), rand(1..10)]
		insert(shots, library)
		win_check(library, "P")
		@counter = 0
	end

	def insert(shots, library)
		check(shots, library)
		hit_check(shots, library)
		library[shots[1].to_i][shots[0].to_i] = "X"
	end

	def check(shots, library)
		if library[shots[1].to_i][shots[0].to_i] == "X" && library == @user_library
			comp_shoot
		elsif library[shots[1].to_i][shots[0].to_i] == "X" && library == @comp_library
			player_shoot
		end
	end

	def hit_check(shots, library)
		if library[shots[1].to_i][shots[0].to_i] == "P"
			board.print_it(library, "X")
			print "Your Ship has been HIT!" + "\n"
		elsif library[shots[1].to_i][shots[0].to_i] == "c"
			board.print_it(library, "X")
			print "HIT!!" + "\n"
		else
			board.print_it(library, "X")
			print "MISS!" + "\n"
		end
	end

	def win_check(library, letter)
		library.keys.each.with_index do |key, index|
			if library[key].values.include?letter
				return
			elsif key == 10 && index == 9
				@end_time = Time.now
				exit_scenario(library)
			end
		end
	end

	def exit_scenario(library)
		time
		puts "You WIN" if library == @comp_library
		puts "You LOSE!" if library == @user_library
		internal_quit(@final_time, @shot_count_user, @shot_count_comp)
	end

	def time
		@final_time = @end_time - @start_time
		@final_time = (@final_time / 60)
		time_conversion(@final_time)
	end

	def time_conversion(total_seconds)
		seconds = total_seconds % 60
		minutes = (total_seconds / 60) % 60
		hours = total_seconds / (60 * 60)

		@final_time = format("%02d:%02d:%02d", hours, minutes, seconds)
	end

	def clear
		puts `clear`
	end

end
