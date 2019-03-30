require 'minitest/autorun'
require 'minitest/pride'
require './lib/vehicle'

class VehicleTest < MiniTest::Test
  attr_reader :motorcycle, :car, :bus

  def setup
    @motorcycle = Vehicle.new("motorcycle")
    @car = Vehicle.new("car")
    @bus = Vehicle.new("bus")
  end

  def test_it_should_exist
    assert_instance_of Vehicle, car
  end

  def test_it_should_have_correct_type
    assert_equal "car", car.type
  end
end
