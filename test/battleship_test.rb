require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/emoji'
require_relative '../battleship'
require 'pry'


class BattleshipTest < Minitest::Test

	def test_if_user_initiations
		battle = Battleship.new
		actual = battle
		expected = Battleship

		assert_instance_of expected, actual
	end

	def test_if_play_initiates
		skip
		battle = Battleship.new.play

		assert_instance_of Battleship.new, battle
	end

end
