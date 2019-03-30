require 'minitest/autorun'
require 'minitest/pride'
require './lib/vehicle'
require './lib/row'

class RowTest < MiniTest::Test
  attr_reader :row, :motorcycle, :car, :bus

  def setup
    @row = Row.new
    @motorcycle = Vehicle.new(:motorcycle)
    @car = Vehicle.new(:car)
    @bus = Vehicle.new(:bus)
  end

  def test_it_should_exist
    assert_instance_of Row, row
  end

  def test_it_should_have_default_values
    assert_equal [], row.spots
  end

  def test_it_should_park_vehicle_if_spot_available
    row.add_a_spot(Spot.new(:motorcycle))

    assert_equal motorcycle, row.attempt_park_vehicle?(motorcycle)
  end

  def test_it_should_not_park_vehicle_if_spot_unavailable
    row.add_a_spot(Spot.new(:motorcycle))
    row.attempt_park_vehicle?(motorcycle)

    refute row.attempt_park_vehicle?(motorcycle)
  end

  def test_it_can_park_a_bus
    row.add_a_spot(Spot.new(:motorcycle))
    row.add_a_spot(Spot.new(:large))
    row.add_a_spot(Spot.new(:large))
    row.add_a_spot(Spot.new(:large))
    row.add_a_spot(Spot.new(:large))
    row.add_a_spot(Spot.new(:large))
    row.add_a_spot(Spot.new(:compact))

    assert row.attempt_park_vehicle?(bus)
  end

  def test_it_cannot_park_a_bus
    row.add_a_spot(Spot.new(:motorcycle))
    row.add_a_spot(Spot.new(:large))
    row.add_a_spot(Spot.new(:large))
    row.add_a_spot(Spot.new(:large))
    row.add_a_spot(Spot.new(:compact))
    row.add_a_spot(Spot.new(:large))
    row.add_a_spot(Spot.new(:compact))
    row.add_a_spot(Spot.new(:large))

    refute row.attempt_park_vehicle?(bus)

  end

end
