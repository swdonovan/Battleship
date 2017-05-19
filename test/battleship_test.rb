require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../battleship'
require 'pry'


class BattleshipTest < Minitest::Test

	def test_if_user_initiations 
		battle = Battleship.new
		expectations =
		actual =

		assert_equal expectations, actual
	end

end
