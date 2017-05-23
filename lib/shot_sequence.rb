require 'pry'

class ShotSequence

	def initialize(user_ship_library, computer_ship_library)
		@user_library = user_ship_library
		@comp_library = computer_ship_library
	end

	def board
		board = BoardGraphic.new
	end

	def shoot
		board
		@counter = 0
		board.print_it(@comp_library, "X")
		player_shoot if @counter == 0
		comp_shoot if @counter == 1
		shoot
	end

	def player_shoot(library = @comp_library)
		p_shots = []
		puts "\n" + "Please enter coordinates to fire at" + "\n"
		p_shots = gets.chomp.downcase.split(//,2)
		p_shots[0] = p_shots[0].ord
		if [*97..106].include?(p_shots[0]) && [*1..10].include?(p_shots[1].to_i)
			insert(p_shots, library)
		else
			player_shoot
		end
		@counter += 1
	end

	def comp_shoot(library = @user_library)
		shots = [rand(97..106), rand(1..10)]
		insert(shots, library)
		@counter = 0
	end

	def insert(shots, library)
		check(shots, library)
		hit_check(shots, library)
		library[shots[1].to_i][shots[0].to_i] = "X"
	end

	def check(shots, library)
		if library[shots[1].to_i][shots[0].to_i] == "X" && library = @user_library
			comp_shoot
		elsif library[shots[1].to_i][shots[0].to_i] == "X" && library = @comp_library
			player_shoot
		end
	end

	def hit_check(shots, library)
		binding.pry
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

end
