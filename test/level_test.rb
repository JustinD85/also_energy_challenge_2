require 'minitest/autorun'
require 'minitest/pride'
require './lib/util'
require './lib/row'
require './lib/level'

class LevelTest < MiniTest::Test
  include ParkingGarageData
 
  attr_reader :level

  def setup
    @level = Level.new
  end

  def test_it_should_exist
    assert_instance_of Level, level
  end

  def test_it_should_have_default_values
    assert_equal [], level.rows
  end

  def test_it_can_add_a_row
    level.add_a_row(Row.new)
    assert_instance_of Row, level.rows.first
  end

  def test_it_can_add_a_vehicle
    level.add_a_row(row_can_park_moto_only)
    level.add_a_row(row_cannot_park_bus)
    level.add_a_row(row_with_space_for_bus_moto_car)

    assert level.attempt_add_a_vehicle?(Vehicle.new(:motorcycle))
  end

end
