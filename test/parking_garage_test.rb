require './lib/util'

class ParkingGarageTest < MiniTest::Test
  include ParkingGarageData

  attr_reader :garage

  def setup
    @garage = ParkingGarage.new
  end
  
  def test_it_should_exist
    assert_instance_of ParkingGarage, garage
  end

  def test_it_has_default_values
    assert [], garage.levels
  end

  def test_it_can_add_levels
    garage.add_a_level(level_with_mix_rows)

    garage.levels.each { |level| assert_instance_of Level, level  }
  end

  def test_it_can_park_a_vehicle
    garage.add_a_level(level_with_mix_rows)

    assert garage.attempt_park_vehicle?(bus)
  end

  def test_it_can_add_a_bus_and_a_car_and_a_motorcycle
    garage.add_a_level(level_with_mix_rows)

    assert garage.attempt_park_vehicle?(bus)
    assert garage.attempt_park_vehicle?(car)
    assert garage.attempt_park_vehicle?(motorcycle)
  end

  def test_it_can_report_no_space_available
    assert_equal "Sorry valued customer, there is no space available.", garage.attempt_park_vehicle?(bus)
  end

end
