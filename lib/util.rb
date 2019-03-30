require 'minitest/autorun'
require 'minitest/pride'
require './lib/level'
require './lib/parking_garage'
require './lib/vehicle'


module ParkingGarageData

  def row_with_space_for_bus_moto_car
    row = Row.new
    row.add_a_spot(Spot.new(:motorcycle))
    row.add_a_spot(Spot.new(:large))
    row.add_a_spot(Spot.new(:large))
    row.add_a_spot(Spot.new(:large))
    row.add_a_spot(Spot.new(:large))
    row.add_a_spot(Spot.new(:large))
    row.add_a_spot(Spot.new(:compact))
    row.add_a_spot(Spot.new(:large))
    row
  end

  def row_cannot_park_bus
    row = Row.new
    row.add_a_spot(Spot.new(:motorcycle))
    row.add_a_spot(Spot.new(:large))
    row.add_a_spot(Spot.new(:large))
    row.add_a_spot(Spot.new(:large))
    row.add_a_spot(Spot.new(:compact))
    row.add_a_spot(Spot.new(:large))
    row.add_a_spot(Spot.new(:compact))
    row.add_a_spot(Spot.new(:large))
    row
  end

  def row_can_park_moto_only
    row = Row.new
    row.add_a_spot(Spot.new(:motorcycle))
    row.add_a_spot(Spot.new(:motorcycle))
    row
  end

  def level_with_mix_rows
    level = Level.new
    level.add_a_row(row_can_park_moto_only)
    level.add_a_row(row_cannot_park_bus)
    level.add_a_row(row_with_space_for_bus_moto_car)
    level
  end

  def bus
    Vehicle.new(:bus)
  end

  def car
    Vehicle.new(:car)
  end

  def motorcycle
    Vehicle.new(:motorcycle)
  end
end
