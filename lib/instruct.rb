# require'./lib/instructions.txt'
module Instruct



	def instructions
		print "	To play Battleship, when prompted to play press p or play once into the game you will be playing against the computer.  You will have the choice of playing in begginner mode which will be played with 2 ships between you and the computer upto advanced which is the 10x10 board that the board game originally has.

		Placing your ships--When prompted to place your ships you will have to enter the coordinates based  the size of the ship.  Your coordinates will have to be adjacent and can not be diagnol.

		Firing- You will be prompted to enter coordinates to fire at.  If you miss, you will be notified that you have missed and visa versa for a hit.  You will also be prompted when your opponent has hit one of your ships as well.

		Winning/losing-- This condition is met only if you or your opponent has no ships left on the board that haven't been hit. Should your opponent have 0 boats left, YOU WIN.  Should you have 0 boats left, YOU LOSE.

		Thank you for reading this painlessly and pointlessly long instructional file.  Would you like to (p)lay or (q)uit?"
		answer = gets.chomp
		game = Battleship.new.play if answer.downcase == "p" || answer.downcase == "play"
		game = Battleship.new.quit if answer.downcase == "q" || answer.downcase == "quit"
	end

end
