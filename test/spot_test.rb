require 'minitest/autorun'
require 'minitest/pride'
require './lib/vehicle'
require './lib/spot'

class SpotTest < Minitest::Test
  attr_reader :spot, :vehicle

  def setup
    @spot = Spot.new(:motorcycle)
    @vehicle = Vehicle.new("motorcycle")
  end

  def test_it_should_exist
    assert_instance_of Spot, spot
  end

  def test_it_has_correct_default_type
    assert_equal :motorcycle, spot.type
  end

  def test_it_is_available_for_parking
    assert_equal true, spot.available?
  end

  def test_it_is_not_available_for_parking
    spot.park_vehicle(vehicle)
    refute spot.available?
  end

  def test_it_can_remove_a_vehicle_that_is_parked
    spot.park_vehicle(vehicle)
    spot.remove_vehicle

    assert_equal true, spot.available?
  end
end
